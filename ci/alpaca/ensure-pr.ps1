param([switch]$LookupOnly)

. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
$branch = $env:ALPACA_BRANCH
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
if ($branch -ne "alpaca/$issue") { throw "Branch does not match issue: $branch" }

$outDir = Join-Path $PSScriptRoot 'out'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

function Get-OpenPr {
    $raw = & gh --no-pager pr list --repo $script:Repo --head $branch --state open --json number
    if ($LASTEXITCODE -ne 0) { throw "gh pr list failed with $LASTEXITCODE" }
    if (-not $raw -or $raw.Trim() -eq '[]') { return $null }
    return @($raw | ConvertFrom-Json)[0].number
}

if (-not $LookupOnly) {
    & git push origin "HEAD:${branch}"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

$pr = Get-OpenPr
if (-not $pr -and -not $LookupOnly) {
    $titleRaw = & gh --no-pager issue view $issue --repo $script:Repo --json title --jq .title
    if ($LASTEXITCODE -ne 0) { throw "gh issue view failed with $LASTEXITCODE" }
    $title = if ($titleRaw) { $titleRaw.Trim() } else { "alpaca #$issue" }
    $titleFile = Join-Path $outDir 'pr-title.txt'
    $bodyFile = Join-Path $outDir 'pr-body.md'
    Write-Utf8File $titleFile $title
    Write-Utf8File $bodyFile "Alpaca-Issue: $issue`r`n`r`nRefs #$issue`r`n"
    & gh --no-pager pr create --repo $script:Repo --base main --head $branch --title-file $titleFile --body-file $bodyFile
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    $pr = Get-OpenPr
}
if ($pr) {
    Write-Utf8File (Join-Path $outDir 'pr.txt') "$pr"
    Write-Output "PR $pr"
    exit 0
}
if ($LookupOnly) {
    Write-Utf8File (Join-Path $outDir 'pr.txt') 'pending'
    Write-Output 'PR pending'
    exit 0
}
throw "Pull request for $branch was not created"
