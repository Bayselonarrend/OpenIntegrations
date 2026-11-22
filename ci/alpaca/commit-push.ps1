. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
$branch = $env:ALPACA_BRANCH
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
if ($branch -ne "alpaca/$issue") { throw "Branch does not match issue: $branch" }

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

$indexed = & git ls-files -- src/addins
foreach ($path in @($indexed)) {
    $norm = [string]$path -replace '\\', '/'
    if ($norm -like 'src/addins/*/artifacts/*' -or $norm -like 'src/addins/*/*/artifacts/*') {
        & git rm -q --cached -- $path
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    }
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

$title = ''
$titleRaw = & gh issue view $issue --repo $script:Repo --json title --jq .title
if ($LASTEXITCODE -eq 0 -and $titleRaw) {
    $title = ($titleRaw -replace '[\r\n]+', ' ').Trim()
}
if (-not $title) { $title = "Issue $issue" }
$stat = (& git diff --cached --stat | Out-String).Trim()
$statLines = @($stat -split "`r?`n")
if ($statLines.Length -gt 40) {
    $stat = (($statLines | Select-Object -First 40) -join "`n") + "`n..."
}
$msgFile = Join-Path $outDir 'commit-msg.txt'
Write-Utf8File $msgFile "#${issue}: $title`r`n`r`n$stat`r`n"
$env:GIT_AUTHOR_NAME = 'Vitaly the Alpaca (bot)'
$env:GIT_AUTHOR_EMAIL = 'vitaly.the.alpaca@gmail.com'
$env:GIT_COMMITTER_NAME = 'Vitaly the Alpaca (bot)'
$env:GIT_COMMITTER_EMAIL = 'vitaly.the.alpaca@gmail.com'
& git commit -F $msgFile
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& git push origin "HEAD:${branch}"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Output 'PUSHED'
exit 0
