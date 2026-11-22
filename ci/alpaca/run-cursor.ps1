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
foreach ($name in @('agent', 'cursor-agent')) {
    $cmd = Get-Command $name -ErrorAction SilentlyContinue
    if ($cmd) { $exe = $cmd.Source; break }
}
if (-not $exe) {
    $candidates = @(
        "$env:LOCALAPPDATA\cursor-agent\agent.cmd",
        "$env:LOCALAPPDATA\cursor-agent\agent.exe",
        "$env:USERPROFILE\.local\bin\agent.exe",
        "$env:USERPROFILE\.cursor\bin\agent.exe",
        "$env:USERPROFILE\.cursor\bin\agent.cmd"
    )
    foreach ($candidate in $candidates) {
        if (Test-Path $candidate) { $exe = $candidate; break }
    }
}
if (-not $exe) {
    throw 'Cursor CLI not found. Install agent or cursor-agent on the Jenkins windows agent and put it on PATH.'
}

$fullTask = (Resolve-Path $TaskFile).Path
$prompt = "Read and follow $fullTask. git, gh and publish-addins.bat are forbidden, including by full path. Jenkins runs them."
$workspace = (Get-Location).Path

# Jenkins keeps stdin open. The CLI then waits for more input and prints nothing.
$parts = @('--print', '--force', '--trust', '--workspace', $workspace, $prompt)
$fileName = $exe
if ($exe -like '*.ps1') {
    $fileName = Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe'
    $parts = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $exe) + $parts
}
$quoted = foreach ($part in $parts) {
    if ($part -match '[\s"]') { '"' + ($part -replace '"', '\"') + '"' } else { $part }
}
$start = New-Object System.Diagnostics.ProcessStartInfo
$start.FileName = $fileName
$start.Arguments = ($quoted -join ' ')
$start.WorkingDirectory = $workspace
$start.UseShellExecute = $false
$start.RedirectStandardInput = $true
$proc = New-Object System.Diagnostics.Process
$proc.StartInfo = $start
if (-not $proc.Start()) { throw 'Cursor CLI did not start' }
$proc.StandardInput.Close()
Write-Output "Cursor CLI: $exe"
Write-Output 'Cursor CLI stdin closed'
$proc.WaitForExit()
Write-Output "Cursor CLI exit: $($proc.ExitCode)"
exit $proc.ExitCode
