. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'targets.ps1')
$ErrorActionPreference = 'Stop'

$outDir = Join-Path $PSScriptRoot 'out'
if (Test-Path $outDir) {
    Remove-Item $outDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$trigger = Join-Path $outDir 'trigger.properties'

function Test-AlpacaWorkBusy {
    if (-not $env:BUILD_URL) { return $false }
    if ($env:BUILD_URL -notmatch '^(https?://[^/]+)') { return $false }
    $root = $Matches[1]
    $tree = [uri]::EscapeDataString('inQueue,builds[building]{0,5}')
    try {
        $job = Invoke-RestMethod -Uri "$root/job/AlpacaWork/api/json?tree=$tree" -TimeoutSec 120
    } catch {
        Write-Host "AlpacaWork status check skipped: $($_.Exception.Message)"
        return $false
    }
    if ($job.inQueue) { return $true }
    foreach ($build in @($job.builds)) {
        if ($build.building) { return $true }
    }
    return $false
}

function Test-Owner([string]$Login) {
    return [string]::Equals($Login, 'bayselonarrend', [StringComparison]::OrdinalIgnoreCase)
}

function Test-OwnerAfter($stamps, $latestStart) {
    $hit = @($stamps | Where-Object { $_.Kind -eq 'human' -and $_.At -gt $latestStart -and (Test-Owner $_.Login) -and -not $_.Eyes })
    return $hit.Count -gt 0
}

if (Test-AlpacaWorkBusy) {
    Write-Output 'AlpacaWork is running or queued'
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
