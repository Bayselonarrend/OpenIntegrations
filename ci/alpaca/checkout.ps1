. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$branch = $env:ALPACA_BRANCH
if ($branch -notmatch '^alpaca/[0-9]+$') { throw "Bad ALPACA_BRANCH: $branch" }

& git fetch origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$remote = & git ls-remote --heads origin $branch
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
if ($remote) {
    & git fetch origin $branch
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    & git checkout -f -B $branch "origin/$branch"
} else {
    & git checkout -f -B $branch origin/main
}
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& git clean -fd -e ci/alpaca/out
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
$outDir = Join-Path $PSScriptRoot 'out'
if (Test-Path $outDir) { Remove-Item $outDir -Recurse -Force }
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

& cmd /c 'call src\addins\sync-addins.bat'
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Output "Checked out $branch"
exit 0
