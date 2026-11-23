. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$heads = & git ls-remote --heads origin 'refs/heads/addins-alpaca-*'
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$removed = 0
foreach ($line in @($heads)) {
    if (-not $line) { continue }
    $ref = ($line -split "`t", 2)[-1].Trim()
    if ($ref -notmatch '^refs/heads/addins-alpaca-([0-9]+)$') { continue }
    $number = $Matches[1]
    $parent = & git ls-remote --heads origin "refs/heads/alpaca/$number"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    if ($parent) { continue }
    & git push origin --delete "addins-alpaca-$number"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Write-Output "Deleted addins-alpaca-$number"
    $removed++
}
if ($removed -eq 0) { Write-Output 'No stale add-in branches' }
exit 0
