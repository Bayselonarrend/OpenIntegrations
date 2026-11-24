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
$env:CI = '1'
$log = Join-Path $PSScriptRoot 'out\cursor-cli.log'
$runner = Join-Path $PSScriptRoot 'out\run-agent.cmd'
if (Test-Path $log) { Remove-Item $log -Force }
$runnerBody = @"
@echo off
call "$exe" --print --force --trust --approve-mcps --output-format stream-json --workspace "$workspace" "$prompt" < NUL > "$log" 2>&1
exit /b %ERRORLEVEL%
"@
Write-Utf8File $runner ($runnerBody.Trim() + "`r`n")
Write-Output "Cursor CLI: $exe"

$start = New-Object System.Diagnostics.ProcessStartInfo
$start.FileName = Join-Path $env:SystemRoot 'System32\cmd.exe'
$start.Arguments = "/d /c `"`"$runner`"`""
$start.WorkingDirectory = $workspace
$start.UseShellExecute = $false
$proc = New-Object System.Diagnostics.Process
$proc.StartInfo = $start
if (-not $proc.Start()) { throw 'Cursor CLI did not start' }

$script:LogOffset = 0
$script:LogCarry = ''
function Read-CursorLog {
    if (-not (Test-Path $log)) { return }
    $fs = New-Object System.IO.FileStream($log, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
    try {
        [void]$fs.Seek($script:LogOffset, [System.IO.SeekOrigin]::Begin)
        $buf = New-Object byte[] 8192
        while (($n = $fs.Read($buf, 0, $buf.Length)) -gt 0) {
            $script:LogOffset += $n
            $script:LogCarry += [System.Text.Encoding]::UTF8.GetString($buf, 0, $n)
            $parts = $script:LogCarry -split "`n", -1
            $script:LogCarry = $parts[-1]
            for ($i = 0; $i -lt $parts.Length - 1; $i++) {
                $line = $parts[$i].TrimEnd("`r")
                if ($line) { Write-Output $line }
                if ($line -match '"type"\s*:\s*"result"') {
                    $script:SawResult = $true
                    $script:ResultAt = Get-Date
                    if ($line -match '"is_error"\s*:\s*true') { $script:ResultError = $true }
                }
            }
            if ($script:LogCarry -match '"type"\s*:\s*"result"') {
                $script:SawResult = $true
                if (-not $script:ResultAt) { $script:ResultAt = Get-Date }
                if ($script:LogCarry -match '"is_error"\s*:\s*true') { $script:ResultError = $true }
            }
        }
    } finally {
        $fs.Dispose()
    }
}
$script:SawResult = $false
$script:ResultError = $false
$script:ResultAt = $null
while ($true) {
    Read-CursorLog
    if ($proc.HasExited) { break }
    if ($script:SawResult -and $script:ResultAt -and ((Get-Date) - $script:ResultAt).TotalSeconds -ge 20) {
        Write-Output 'Cursor CLI finished the turn and did not exit. Stopping it.'
        & taskkill.exe /F /T /PID $proc.Id | Out-Null
        break
    }
    Start-Sleep -Milliseconds 500
}
if (-not $proc.HasExited) { [void]$proc.WaitForExit(15000) }
Start-Sleep -Milliseconds 300
Read-CursorLog
if ($script:LogCarry.Trim()) { Write-Output $script:LogCarry.TrimEnd("`r") }
$sawResult = $script:SawResult
$resultError = $script:ResultError
if ($sawResult) {
    if ($resultError) { exit 1 }
    exit 0
}
Write-Output "Cursor CLI exit: $($proc.ExitCode)"
exit $proc.ExitCode
