#Requires -Version 5.1
<#
.SYNOPSIS
  Replace duplicate en/addin and BSL Template.addin files with symlinks to src/ru/OInt/addins.

.NOTES
  Run only after team agrees. Requires symlink support on Windows (Developer Mode + core.symlinks=true).
  Does not rewrite Git history — commit the result separately.
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch] $Force
)

$ErrorActionPreference = 'Stop'
$RepoRoot = (git -C $PSScriptRoot rev-parse --show-toplevel)
Set-Location $RepoRoot

$ruAddins = Join-Path $RepoRoot 'src\ru\OInt\addins'
if (-not (Test-Path $ruAddins)) {
    throw "Canonical directory not found: $ruAddins"
}

function New-LinkFile([string] $LinkPath, [string] $TargetRelative) {
    $dir = Split-Path $LinkPath -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    if (Test-Path $LinkPath) {
        if ($Force) {
            Remove-Item -LiteralPath $LinkPath -Force
        } else {
            Write-Warning "Skip existing: $LinkPath"
            return
        }
    }
    if ($PSCmdlet.ShouldProcess($LinkPath, "symlink -> $TargetRelative")) {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetRelative | Out-Null
    }
}

Get-ChildItem -Path $ruAddins -Filter '*.zip' | ForEach-Object {
    $name = $_.Name
    $lib = [System.IO.Path]::GetFileNameWithoutExtension($name)

    # src/en/OInt/addins/OPI_Foo.zip -> ../../ru/OInt/addins/OPI_Foo.zip
    $enZip = Join-Path $RepoRoot "src\en\OInt\addins\$name"
    New-LinkFile $enZip "..\..\ru\OInt\addins\$name"

    # src/*/BSL/.../OPI_Foo/Template.addin -> ../../../../../../ru/OInt/addins/OPI_Foo.zip
    $relToRu = "..\..\..\..\..\..\ru\OInt\addins\$name"
    foreach ($lang in @('ru', 'en')) {
        $tpl = Join-Path $RepoRoot "src\$lang\BSL\OpenIntegrations\src\CommonTemplates\$lib\Template.addin"
        if (Test-Path (Split-Path $tpl -Parent)) {
            New-LinkFile $tpl $relToRu
        }
    }
}

Write-Host @"
Symlinks created. Verify:
  git config core.symlinks true
  git add -A && git status
  Run 1C/EDT and OInt tests on your platform.

Git stores symlink as a small object; at HEAD you keep one zip blob + link metadata for other paths.
"@
