. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'targets.ps1')
$ErrorActionPreference = 'Stop'

$outDir = Join-Path $PSScriptRoot 'out'
if (Test-Path $outDir) {
    Remove-Item $outDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$trigger = Join-Path $outDir 'trigger.properties'

function Resolve-LongPath([string]$Path) {
    return (Get-Item -LiteralPath $Path).FullName
}

function Get-JenkinsHome {
    $candidate = $null
    if ($env:JENKINS_HOME -and (Test-Path -LiteralPath $env:JENKINS_HOME)) {
        $candidate = $env:JENKINS_HOME
    } elseif ($env:WORKSPACE) {
        $parent = Split-Path (Split-Path $env:WORKSPACE -Parent) -Parent
        if ($parent -and (Test-Path -LiteralPath (Join-Path $parent 'jobs'))) {
            $candidate = $parent
        }
    }
    if (-not $candidate) {
        $local = Join-Path $env:LOCALAPPDATA 'Jenkins\.jenkins'
        if (Test-Path -LiteralPath $local) { $candidate = $local }
    }
    if (-not $candidate) { return $null }
    return (Resolve-LongPath $candidate)
}

function Add-JenkinsJobDirs([string]$Dir, $Bag) {
    $jobsDir = Join-Path $Dir 'jobs'
    if (-not (Test-Path -LiteralPath $jobsDir)) { return }
    foreach ($child in @(Get-ChildItem -LiteralPath $jobsDir -Directory)) {
        if (Test-Path -LiteralPath (Join-Path $child.FullName 'builds')) {
            [void]$Bag.Add($child.FullName)
        }
        Add-JenkinsJobDirs $child.FullName $Bag
    }
}

function Get-JobFullName([string]$RootDir, [string]$JobDir) {
    $rel = $JobDir.Substring($RootDir.Length).TrimStart('\', '/')
    $parts = @($rel -split '[\\/]' | Where-Object { $_ -and $_ -ne 'jobs' })
    return ($parts -join '/')
}

function Get-OtherRunningJobs {
    $rootDir = Get-JenkinsHome
    if (-not $rootDir) { throw 'Jenkins home not found' }
    $dirs = New-Object System.Collections.Generic.List[string]
    Add-JenkinsJobDirs $rootDir $dirs
    $selfName = [string]$env:JOB_NAME
    $selfNumber = [string]$env:BUILD_NUMBER
    $found = New-Object System.Collections.Generic.List[string]
    foreach ($dir in $dirs) {
        $permalinks = Join-Path $dir 'builds\permalinks'
        if (-not (Test-Path -LiteralPath $permalinks)) { continue }
        $lastBuild = 0
        $lastCompleted = 0
        foreach ($line in [System.IO.File]::ReadAllLines($permalinks)) {
            if ($line -match '^lastBuild\s+(\d+)\s*$') { $lastBuild = [int]$Matches[1] }
            if ($line -match '^lastCompletedBuild\s+(-?\d+)\s*$') { $lastCompleted = [int]$Matches[1] }
        }
        if ($lastBuild -lt 1 -or $lastBuild -eq $lastCompleted) { continue }
        $name = Get-JobFullName $rootDir (Resolve-LongPath $dir)
        if ($name -eq $selfName -and [string]$lastBuild -eq $selfNumber) { continue }
        [void]$found.Add("$name #$lastBuild")
    }
    return @($found)
}

function Test-Owner([string]$Login) {
    return [string]::Equals($Login, 'bayselonarrend', [StringComparison]::OrdinalIgnoreCase)
}

function Test-OwnerAfter($stamps, $latestStart) {
    $hit = @($stamps | Where-Object { $_.Kind -eq 'human' -and $_.At -gt $latestStart -and (Test-Owner $_.Login) -and -not $_.Eyes })
    return $hit.Count -gt 0
}

function Get-HeadPr([string]$Branch, [string]$State) {
    $raw = & gh pr list --repo $script:Repo --head $Branch --state $State --limit 1 --json number,mergedAt
    if ($LASTEXITCODE -ne 0) { throw "gh pr list failed with $LASTEXITCODE" }
    if (-not $raw -or $raw.Trim() -eq '[]') { return $null }
    return @($raw | ConvertFrom-Json)[0]
}

try {
    $otherJobs = @(Get-OtherRunningJobs)
} catch {
    Write-Output "Cannot see running Jenkins jobs, cycle not started: $($_.Exception.Message)"
    exit 0
}
if ($otherJobs.Count -gt 0) {
    Write-Output ("Another job is running, AlpacaWatch will not start a cycle: " + ($otherJobs -join ', '))
    exit 0
}

$rawIssues = & gh issue list --repo $script:Repo --assignee VitalyTheAlpaca --state open --limit 1 --json number,title,state
if ($LASTEXITCODE -ne 0) { throw "gh issue list failed with $LASTEXITCODE" }
if (-not $rawIssues -or $rawIssues.Trim() -eq '[]') {
    Write-Output 'No open issue assigned to VitalyTheAlpaca'
    exit 0
}
$issue = @($rawIssues | ConvertFrom-Json)[0]
if ($issue.state -ne 'OPEN') {
    Write-Output "issue=$($issue.number) is $($issue.state)"
    exit 0
}
$branch = "alpaca/$($issue.number)"

$rawPrs = & gh pr list --repo $script:Repo --head $branch --state open --json number
if ($LASTEXITCODE -ne 0) { throw "gh pr list failed with $LASTEXITCODE" }
$prNumber = $null
if ($rawPrs -and $rawPrs.Trim() -ne '[]') {
    $prNumber = @($rawPrs | ConvertFrom-Json)[0].number
}

if (-not $prNumber) {
    $merged = Get-HeadPr $branch 'merged'
    if ($merged) {
        $stamps = @(Get-AlpacaStamps -IssueNumber ([int]$issue.number) -PullNumber ([int]$merged.number))
        $starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
        if ($starts.Count -gt 0) {
            $latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
        } else {
            $latestStart = [datetimeoffset]::Parse([string]$merged.mergedAt)
        }
        if (Test-OwnerAfter $stamps $latestStart) {
            Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
            Write-Output "trigger issue=$($issue.number) reason=comments"
            exit 0
        }
        Write-Output "issue=$($issue.number) PR #$($merged.number) is merged, no new owner comments"
        exit 0
    }
    $stamps = @(Get-AlpacaStamps -IssueNumber ([int]$issue.number) -PullNumber 0)
    $starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
    if ($starts.Count -eq 0) {
        Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=new`r`n"
        Write-Output "trigger issue=$($issue.number) reason=new"
        exit 0
    }
    $latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
    if (Test-OwnerAfter $stamps $latestStart) {
        Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
        Write-Output "trigger issue=$($issue.number) reason=comments"
        exit 0
    }
    Write-Output "issue=$($issue.number) has no PR and no new owner comments"
    exit 0
}

$stamps = @(Get-AlpacaStamps -IssueNumber ([int]$issue.number) -PullNumber ([int]$prNumber))

$starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
if ($starts.Count -eq 0) {
    Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
    Write-Output "trigger issue=$($issue.number) reason=comments (no cycle marker yet)"
    exit 0
}

$latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
if (Test-OwnerAfter $stamps $latestStart) {
    Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
    Write-Output "trigger issue=$($issue.number) reason=comments"
    exit 0
}

Write-Output "issue=$($issue.number) has no new owner comments"
exit 0
