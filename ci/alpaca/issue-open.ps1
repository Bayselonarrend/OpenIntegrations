. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }

$state = (& gh issue view $issue --repo $script:Repo --json state --jq .state | Out-String).Trim()
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
if ($state -ne 'OPEN') {
    Write-Output "issue $issue is $state"
    exit 3
}
Write-Output "issue $issue is open"
exit 0
