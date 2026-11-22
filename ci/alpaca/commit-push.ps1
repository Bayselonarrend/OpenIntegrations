. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
$branch = $env:ALPACA_BRANCH
$reason = $env:ALPACA_REASON
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
if ($branch -ne "alpaca/$issue") { throw "Branch does not match issue: $branch" }
if (-not $reason) { $reason = 'edit' }

$outDir = Join-Path $PSScriptRoot 'out'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$trackedLogs = & git ls-files '*dependencies.log'
foreach ($log in @($trackedLogs)) {
    if ($log) { & git checkout -q -- $log }
}

& git add -A
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
if (Test-Path 'ci/alpaca/out') {
    & git reset -q -- ci/alpaca/out
}

$staged = & git diff --cached --name-only
foreach ($path in @($staged)) {
    if ($path -and $path -like '*dependencies.log') {
        & git reset -q -- $path
        & git checkout -q -- $path
    }
}

& git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Output 'NO_CHANGES'
    exit 2
}
if ($LASTEXITCODE -gt 1) { exit $LASTEXITCODE }

$msgFile = Join-Path $outDir 'commit-msg.txt'
Write-Utf8File $msgFile "alpaca #$issue`r`n`r`n$reason`r`n"
& git commit -F $msgFile
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& git push origin "HEAD:${branch}"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Output 'PUSHED'
exit 0
