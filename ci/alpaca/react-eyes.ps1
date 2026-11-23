. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'targets.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
$prPath = Join-Path $PSScriptRoot 'out\pr.txt'
$pr = 0
if (Test-Path $prPath) {
    $prText = (Read-Utf8File $prPath).Trim()
    if ($prText -match '^[0-9]+$') { $pr = [int]$prText }
}

$stamps = @(Get-AlpacaStamps -IssueNumber ([int]$issue) -PullNumber $pr)
$starts = @($stamps | Where-Object { $_.Kind -eq 'start' })
if ($starts.Count -eq 0) { exit 2 }
$latestStart = ($starts | Sort-Object At | Select-Object -Last 1).At
$targets = @($stamps | Where-Object {
    $_.Kind -eq 'human' -and $_.At -gt $latestStart -and $_.Login -eq 'bayselonarrend' -and -not $_.Eyes -and $_.Id
})
if ($targets.Count -eq 0) { exit 2 }

$seen = @{}
foreach ($target in $targets) {
    if ($seen.ContainsKey($target.Id)) { continue }
    $seen[$target.Id] = $true
    Add-Eyes $target.Id
    Write-Output "eyes $($target.Id)"
}
exit 0
