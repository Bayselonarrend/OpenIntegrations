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
    $raw = & gh pr list --repo $script:Repo --head $branch --state open --json number
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
    $titleRaw = & gh issue view $issue --repo $script:Repo --json title --jq .title
    if ($LASTEXITCODE -ne 0) { throw "gh issue view failed with $LASTEXITCODE" }
    $title = if ($titleRaw) { ($titleRaw -replace '[\r\n]+', ' ').Trim() } else { "alpaca #$issue" }
    if (-not $title) { $title = "alpaca #$issue" }
    $body = "Alpaca-Issue: $issue`n`nRefs #$issue`n"
    $payloadFile = Join-Path $outDir 'pr-create.json'
    # This gh has --body-file but not --title-file. The JSON file keeps a non-ASCII title intact.
    $payload = @{ title = $title; head = $branch; base = 'main'; body = $body } | ConvertTo-Json -Compress
    Write-Utf8File $payloadFile $payload
    & gh api --method POST "repos/$script:Repo/pulls" --input $payloadFile
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
