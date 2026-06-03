#Requires -Version 5.1
<#
.SYNOPSIS
  Removes all historical versions of native add-in zips and Template.addin from Git history,
  then restores the current files from a backup in a single new commit.

.DESCRIPTION
  Uses git-filter-repo. Rewrites ALL branches/tags in the local clone.
  Coordinate with the team before force-pushing.

.PARAMETER BackupDir
  Directory for a full copy of binaries before rewrite. Default: %TEMP%\opi-addin-prune-<timestamp>

.PARAMETER SkipGc
  Do not run git gc --prune=now after filter-repo.

.PARAMETER DryRun
  Only show planned actions and backup file count; do not run filter-repo.

.PARAMETER AllowDirty
  Continue when the working tree has unrelated uncommitted changes.

.EXAMPLE
  .\service\git\prune-addin-binaries-from-history.ps1 -BackupDir D:\backup\opi-addins
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string] $BackupDir,
    [switch] $SkipGc,
    [switch] $DryRun,
    [switch] $AllowDirty
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$RepoRoot = (git -C $PSScriptRoot rev-parse --show-toplevel 2>$null)
if (-not $RepoRoot) {
    throw 'Not inside a Git repository.'
}
Set-Location $RepoRoot

function Get-FilterRepoInvocation() {
    if (Get-Command 'git-filter-repo' -ErrorAction SilentlyContinue) {
        return @{ File = 'git-filter-repo'; Prefix = @() }
    }
    foreach ($py in @('python', 'py')) {
        if (Get-Command $py -ErrorAction SilentlyContinue) {
            & $py -m git_filter_repo --version *> $null
            if ($LASTEXITCODE -eq 0) {
                return @{ File = $py; Prefix = @('-m', 'git_filter_repo') }
            }
        }
    }
    throw @'
git-filter-repo not found.
Install: pip install git-filter-repo
Or ensure python -m git_filter_repo works.
'@
}

$FilterRepo = Get-FilterRepoInvocation

$PathGlobs = @(
    'src/ru/OInt/addins/*.zip'
    'src/en/OInt/addins/*.zip'
    'src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
    'src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
)

if (-not $BackupDir) {
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $BackupDir = Join-Path $env:TEMP "opi-addin-prune-$stamp"
}

if (-not $DryRun -and -not $AllowDirty) {
    $status = git status --porcelain
    if ($status) {
        Write-Warning "Working tree is not clean. Commit or stash changes before rewriting history."
        git status -sb
        if (-not $PSCmdlet.ShouldContinue("Continue anyway?", "Dirty working tree")) {
            exit 1
        }
    }
}

New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

$backedUp = 0
foreach ($pattern in $PathGlobs) {
    $fullPattern = Join-Path $RepoRoot ($pattern -replace '/','\')
    $files = @(Get-ChildItem -Path $fullPattern -File -ErrorAction SilentlyContinue)
    foreach ($f in $files) {
        $rel = $f.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
        $dest = Join-Path $BackupDir ($rel -replace '/','\')
        $destDir = Split-Path $dest -Parent
        New-Item -ItemType Directory -Force -Path $destDir | Out-Null
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
        $backedUp++
    }
}

Write-Host "Backed up $backedUp files to: $BackupDir"

if ($DryRun) {
    Write-Host "Dry run. Would run git filter-repo --invert-paths for:"
    $PathGlobs | ForEach-Object { Write-Host "  --path-glob $_" }
    exit 0
}

$filterArgs = $FilterRepo.Prefix + @('--force', '--invert-paths')
foreach ($g in $PathGlobs) {
    $filterArgs += '--path-glob'
    $filterArgs += $g
}

Write-Host "Rewriting history (this may take several minutes)..."
& $FilterRepo.File @filterArgs
if ($LASTEXITCODE -ne 0) {
    throw "git filter-repo failed with exit code $LASTEXITCODE"
}

Write-Host "Restoring current binaries from backup..."
$backupFiles = Get-ChildItem -Path $BackupDir -Recurse -File
foreach ($bf in $backupFiles) {
    $rel = $bf.FullName.Substring($BackupDir.Length).TrimStart('\', '/')
    $target = Join-Path $RepoRoot ($rel -replace '/','\')
    $targetDir = Split-Path $target -Parent
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Copy-Item -LiteralPath $bf.FullName -Destination $target -Force
}

git add -- `
    'src/ru/OInt/addins/*.zip' `
    'src/en/OInt/addins/*.zip' `
    'src/ru/BSL/OpenIntegrations/src/CommonTemplates' `
    'src/en/BSL/OpenIntegrations/src/CommonTemplates'

$diffCached = git diff --cached --name-only
if (-not $diffCached) {
    Write-Warning 'Nothing staged after restore. Check backup paths.'
} else {
    git commit -m @"
chore: restore add-in binaries after history prune

Removed all prior versions of OInt zips and Template.addin from Git history
via git-filter-repo; only current tree restored from backup.
"@
}

if (-not $SkipGc) {
    Write-Host "Running git gc --prune=now ..."
    git gc --prune=now
    git count-objects -vH
}

$originUrl = $null
try { $originUrl = git remote get-url origin 2>$null } catch { }
Write-Host @"

Done.

IMPORTANT:
  - git filter-repo removed the 'origin' remote (if it existed).
  - All commit hashes changed. Every collaborator must re-clone or reset hard after you push.

Next steps:
  1. Verify tests / EDT load add-ins from restored paths.
  2. Re-add remote if needed:
       git remote add origin <url>
  3. Force-push rewritten branches (example):
       git push --force-with-lease origin main
  4. Optional: reduce 4x file copies — see service/git/README.md (symlinks or gitignore + CI copy).

Backup kept at: $BackupDir
"@

if ($originUrl) {
    Write-Host "Previous origin URL was: $originUrl"
}
