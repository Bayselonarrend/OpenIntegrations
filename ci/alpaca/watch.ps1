. (Join-Path $PSScriptRoot 'common.ps1')
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
        $job = Invoke-RestMethod -Uri "$root/job/AlpacaWork/api/json?tree=$tree" -TimeoutSec 20
    } catch {
        Write-Output "AlpacaWork status check failed: $($_.Exception.Message)"
        return $false
    }
    if ($job.inQueue) { return $true }
    foreach ($build in @($job.builds)) {
        if ($build.building) { return $true }
    }
    return $false
}

function Add-Stamps($bag, $items, $prop) {
    foreach ($item in @($items)) {
        if (-not $item -or -not $item.body) { continue }
        $raw = $item.$prop
        if (-not $raw) { continue }
        $stamp = [datetimeoffset]::Parse([string]$raw)
        $kind = 'human'
        if ($item.body -like '*<!-- alpaca-start -->*') { $kind = 'start' }
        elseif ($item.body -like '*<!-- alpaca -->*') { $kind = 'job' }
        $bag.Add([pscustomobject]@{ At = $stamp; Kind = $kind }) | Out-Null
    }
}

if (Test-AlpacaWorkBusy) {
    Write-Output 'AlpacaWork is running or queued'
    exit 0
}

$rawIssues = & gh --no-pager issue list --repo $script:Repo --label alpaca --state open --limit 1 --json number,title
if ($LASTEXITCODE -ne 0) { throw "gh issue list failed with $LASTEXITCODE" }
if (-not $rawIssues -or $rawIssues.Trim() -eq '[]') {
    Write-Output 'No open alpaca issue'
    exit 0
}
$issue = @($rawIssues | ConvertFrom-Json)[0]
$branch = "alpaca/$($issue.number)"

$rawPrs = & gh --no-pager pr list --repo $script:Repo --head $branch --state open --json number
if ($LASTEXITCODE -ne 0) { throw "gh pr list failed with $LASTEXITCODE" }
$prNumber = $null
if ($rawPrs -and $rawPrs.Trim() -ne '[]') {
    $prNumber = @($rawPrs | ConvertFrom-Json)[0].number
}

if (-not $prNumber) {
    $issueOnly = & gh --no-pager issue view $issue.number --repo $script:Repo --json comments
    if ($LASTEXITCODE -ne 0) { throw "gh issue view failed with $LASTEXITCODE" }
    $stamps = New-Object System.Collections.Generic.List[object]
    Add-Stamps $stamps ($issueOnly | ConvertFrom-Json).comments 'createdAt'
    $starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
    if ($starts.Count -eq 0) {
        Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=new`r`n"
        Write-Output "trigger issue=$($issue.number) reason=new"
        exit 0
    }
    $latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
    $humanAfter = @($stamps | Where-Object { $_.Kind -eq 'human' -and $_.At -gt $latestStart })
    if ($humanAfter.Count -gt 0) {
        Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
        Write-Output "trigger issue=$($issue.number) reason=comments"
        exit 0
    }
    Write-Output "issue=$($issue.number) has no PR and no new comments"
    exit 0
}

$issueView = & gh --no-pager issue view $issue.number --repo $script:Repo --json comments
if ($LASTEXITCODE -ne 0) { throw "gh issue view failed with $LASTEXITCODE" }
$prView = & gh --no-pager pr view $prNumber --repo $script:Repo --json comments,reviews
if ($LASTEXITCODE -ne 0) { throw "gh pr view failed with $LASTEXITCODE" }
$issueObj = $issueView | ConvertFrom-Json
$prObj = $prView | ConvertFrom-Json

$stamps = New-Object System.Collections.Generic.List[object]
Add-Stamps $stamps $issueObj.comments 'createdAt'
Add-Stamps $stamps $prObj.comments 'createdAt'
Add-Stamps $stamps $prObj.reviews 'submittedAt'

$starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
if ($starts.Count -eq 0) {
    Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
    Write-Output "trigger issue=$($issue.number) reason=comments (no cycle marker yet)"
    exit 0
}

$latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
$humanAfter = @($stamps | Where-Object { $_.Kind -eq 'human' -and $_.At -gt $latestStart })
if ($humanAfter.Count -gt 0) {
    Write-Utf8File $trigger "issue=$($issue.number)`r`nreason=comments`r`n"
    Write-Output "trigger issue=$($issue.number) reason=comments"
    exit 0
}

Write-Output "issue=$($issue.number) has no new comments"
exit 0
