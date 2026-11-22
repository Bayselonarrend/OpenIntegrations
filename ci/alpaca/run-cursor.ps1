param([Parameter(Mandatory = $true)][string]$TaskFile)

. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $TaskFile)) { throw "Task file not found: $TaskFile" }

$deny = Join-Path $PSScriptRoot 'deny'
$env:PATH = "$deny;$env:PATH"
# The bundled Node trusts Mozilla roots only. A proxy CA installed in Windows is invisible until this is set.
$env:NODE_USE_SYSTEM_CA = '1'
$configDir = Join-Path $PSScriptRoot 'out\cursor-config'
New-Item -ItemType Directory -Force -Path $configDir | Out-Null
$env:CURSOR_CONFIG_DIR = $configDir
$config = @'
{
  "version": 1,
  "editor": { "vimMode": false },
  "permissions": {
    "allow": [],
    "deny": [
      "Shell(git)",
      "Shell(git.exe)",
      "Shell(gh)",
      "Shell(gh.exe)",
      "Shell(publish-addins.bat)",
      "Shell(publish-addins)"
    ]
  }
}
'@
Write-Utf8File (Join-Path $configDir 'cli-config.json') $config

$exe = $null
$candidates = @(
    "$env:LOCALAPPDATA\cursor-agent\agent.cmd",
    "$env:LOCALAPPDATA\cursor-agent\cursor-agent.cmd",
    "$env:LOCALAPPDATA\cursor-agent\agent.exe",
    "$env:USERPROFILE\.local\bin\agent.exe",
    "$env:USERPROFILE\.cursor\bin\agent.exe"
)
foreach ($candidate in $candidates) {
    if (Test-Path $candidate) { $exe = $candidate; break }
}
if (-not $exe) {
    foreach ($name in @('agent.cmd', 'cursor-agent.cmd', 'agent.exe')) {
        $cmd = Get-Command $name -ErrorAction SilentlyContinue
        if ($cmd -and $cmd.Source -notlike '*.ps1') { $exe = $cmd.Source; break }
    }
}
if (-not $exe) {
    throw 'Cursor CLI not found. Install agent.cmd on the Jenkins windows agent.'
}

$fullTask = (Resolve-Path $TaskFile).Path
$prompt = "Read and follow $fullTask. git, gh and publish-addins.bat are forbidden, including by full path. Jenkins runs them."
$workspace = (Get-Location).Path
Write-Output "Cursor CLI: $exe"
# Jenkins keeps stdin open. After the edits the CLI waits for another message and never exits.
$launch = "call `"$exe`" --print --force --trust --workspace `"$workspace`" `"$prompt`" < NUL"
& cmd.exe /d /c $launch
$code = $LASTEXITCODE
Write-Output "Cursor CLI exit: $code"
exit $code
