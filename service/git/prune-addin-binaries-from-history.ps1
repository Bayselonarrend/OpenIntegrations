#Requires -Version 5.1
<#
.SYNOPSIS
  Removes add-in binaries from main/stable/tags history (not branch addins).

.DESCRIPTION
  Uses git-filter-repo --invert-paths on main, stable and tags only.
  Does not re-commit binaries to main/stable (they live on origin/addins).

.PARAMETER BackupDir
  Optional backup of working-tree copies before rewrite.

.PARAMETER SkipGc
  Do not run git gc --prune=now after filter-repo.

.PARAMETER DryRun
  Only show planned actions; do not run filter-repo.

.PARAMETER AllowDirty
  Continue when the working tree has uncommitted changes.
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

function Test-GitRef([string] $Ref) {
    git show-ref --verify --quiet $Ref 2>$null
    return $LASTEXITCODE -eq 0
}

function Get-RewriteRefs() {
    [string[]] $refs = @()

    foreach ($name in @('main', 'stable')) {
        if (Test-GitRef "refs/heads/$name") {
            $refs += "refs/heads/$name"
        }
        elseif (Test-GitRef "refs/remotes/origin/$name") {
            git branch -f $name "refs/remotes/origin/$name" 2>$null | Out-Null
            if (Test-GitRef "refs/heads/$name") {
                $refs += "refs/heads/$name"
            }
        }
    }

    $tagRefs = @(git for-each-ref --format='%(refname)' refs/tags)
    if ($tagRefs) {
        $refs += $tagRefs
    }

    if ($refs.Count -eq 0) {
        throw 'No refs to rewrite (expected refs/heads/main and/or stable).'
    }

    return $refs
}

$FilterRepo = Get-FilterRepoInvocation

$PathGlobs = @(
    'src/ru/OInt/addins/*'
    'src/en/OInt/addins/*'
    'src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
    'src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
)

if (-not $DryRun -and -not $AllowDirty) {
    $status = git status --porcelain
    if ($status) {
        Write-Warning 'Working tree is not clean. Commit or stash changes before rewriting history.'
        git status -sb
        if (-not $PSCmdlet.ShouldContinue('Continue anyway?', 'Dirty working tree')) {
            exit 1
        }
    }
}

Write-Host 'Fetching origin (branches and tags)...'
git fetch origin --tags --prune 2>$null

$rewriteRefs = Get-RewriteRefs
Write-Host 'Refs to rewrite (addins is excluded):'
$rewriteRefs | ForEach-Object { Write-Host "  $_" }

if ($BackupDir) {
    if (-not $DryRun) {
        New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null
    }
    $backedUp = 0
    foreach ($pattern in $PathGlobs) {
        $fullPattern = Join-Path $RepoRoot ($pattern -replace '/','\')
        $files = @(Get-ChildItem -Path $fullPattern -File -ErrorAction SilentlyContinue)
        foreach ($f in $files) {
            $rel = $f.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
            if ($DryRun) {
                Write-Host "  would backup: $rel"
            } else {
                $dest = Join-Path $BackupDir ($rel -replace '/','\')
                $destDir = Split-Path $dest -Parent
                New-Item -ItemType Directory -Force -Path $destDir | Out-Null
                Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
            }
            $backedUp++
        }
    }
    Write-Host "Backed up $backedUp working-tree files to: $BackupDir"
}

if ($DryRun) {
    Write-Host 'Dry run. Would run git filter-repo --invert-paths for:'
    $PathGlobs | ForEach-Object { Write-Host "  --path-glob $_" }
    exit 0
}

$filterArgs = $FilterRepo.Prefix + @('--force', '--invert-paths', '--refs') + $rewriteRefs
foreach ($g in $PathGlobs) {
    $filterArgs += '--path-glob'
    $filterArgs += $g
}

Write-Host 'Rewriting history (addins branch is not touched; may take several minutes)...'
& $FilterRepo.File @filterArgs
if ($LASTEXITCODE -ne 0) {
    throw "git filter-repo failed with exit code $LASTEXITCODE"
}

if ($BackupDir -and (Test-Path $BackupDir)) {
    Write-Host 'Restoring working-tree copies from backup (not staged; paths are gitignored on main)...'
    Get-ChildItem -Path $BackupDir -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($BackupDir.Length).TrimStart('\', '/')
        $target = Join-Path $RepoRoot ($rel -replace '/','\')
        $targetDir = Split-Path $target -Parent
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
        Copy-Item -LiteralPath $_.FullName -Destination $target -Force
    }
}

if (-not $SkipGc) {
    Write-Host 'Running git gc --prune=now ...'
    git gc --prune=now
    git count-objects -vH
}

$originUrl = $null
try { $originUrl = git remote get-url origin 2>$null } catch { }
Write-Host @"

Done.

IMPORTANT:
  - Branch addins was NOT rewritten (binaries stay on origin/addins).
  - main/stable/tags no longer contain add-in artifacts in history.
  - git filter-repo may remove the 'origin' remote.
  - All rewritten commit hashes changed. Re-clone or hard reset after push.

Next steps:
  1. Restore working-tree binaries if needed: src\addins\sync-addins.bat
  2. Re-add remote if needed: git remote add origin <url>
  3. Force-push rewritten refs (NOT addins):
       git push --force-with-lease origin main
       git push --force-with-lease origin stable
       git push --force origin '+refs/tags/*:refs/tags/*'
  4. See service/git/README.md for mirror GC.

"@

if ($originUrl) {
    Write-Host "Previous origin URL was: $originUrl"
}
