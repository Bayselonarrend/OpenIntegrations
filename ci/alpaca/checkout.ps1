. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$branch = $env:ALPACA_BRANCH
if ($branch -notmatch '^alpaca/([0-9]+)$') { throw "Bad ALPACA_BRANCH: $branch" }
$addinsBranch = "addins-alpaca-$($Matches[1])" }

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

# Pipeline scripts stay on main. The issue branch keeps the copy from the day it was cut.
& git checkout origin/main -- ci/alpaca
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& git reset -q HEAD -- ci/alpaca
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
foreach ($file in @(& git ls-files -- ci/alpaca)) {
    if (-not $file) { continue }
    & git update-index --skip-worktree -- $file
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

$tooling = @(
    'src/addins/sync-addins.bat',
    'src/addins/sync-addins.sh',
    'src/addins/publish-addins.bat'
)
& git checkout origin/main -- @tooling
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& git reset -q HEAD -- @tooling
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
foreach ($file in $tooling) {
    & git update-index --skip-worktree -- $file
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

$outDir = Join-Path $PSScriptRoot 'out'
if (Test-Path $outDir) { Remove-Item $outDir -Recurse -Force }
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$env:ADDINS_BRANCH = $addinsBranch
& cmd /c 'call src\addins\sync-addins.bat'
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Output "Checked out $branch"
exit 0
