param(
    [Parameter(Mandatory = $true)][string]$IndexPath,
    [Parameter(Mandatory = $true)][int]$Port,
    [Parameter(Mandatory = $true)][string]$ServerDir,
    [Parameter(Mandatory = $true)][string]$NodePath,
    [string]$Bind = '127.0.0.1',
    [string]$AllowedHosts = '127.0.0.1,localhost'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $IndexPath)) {
    throw "MCP index not found: $IndexPath"
}
if (-not (Test-Path -LiteralPath $NodePath)) {
    throw "node.exe not found: $NodePath"
}
if (-not (Test-Path -LiteralPath $ServerDir)) {
    throw "MCP server directory not found: $ServerDir"
}

function Get-ListenerPids([int]$LocalPort) {
    $found = New-Object System.Collections.Generic.List[int]
    $pattern = ':' + $LocalPort + '\s'
    $lines = netstat -ano
    foreach ($raw in @($lines)) {
        $line = [string]$raw
        $line = $line.Trim()
        if ($line -notmatch $pattern) {
            continue
        }
        if ($line -match 'LISTENING\s+(\d+)\s*$') {
            $procId = [int]$Matches[1]
            if (-not $found.Contains($procId)) {
                [void]$found.Add($procId)
            }
        }
    }
    return $found
}

foreach ($procId in @(Get-ListenerPids $Port)) {
    if ($procId -le 4) {
        continue
    }
    Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue
    Write-Output "Stopped listener $procId on port $Port"
}

Start-Sleep -Milliseconds 400

$logDir = Join-Path $env:TEMP 'openintegrations-docs-mcp'
if (-not (Test-Path -LiteralPath $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}
$log = Join-Path $logDir ("port-" + $Port + ".log")
if (Test-Path -LiteralPath $log) {
    Remove-Item -LiteralPath $log -Force
}

$quotedNode = '"' + $NodePath + '"'
$quotedLog = '"' + $log + '"'
$inner = "set `"MCP_INDEX=$IndexPath`"&& set `"MCP_HOST=$Bind`"&& set `"PORT=$Port`"&& set `"MCP_ALLOWED_HOSTS=$AllowedHosts`"&& $quotedNode server.mjs >> $quotedLog 2>&1"
$commandLine = 'cmd.exe /d /c "' + $inner + '"'

$result = Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{
    CommandLine      = $commandLine
    CurrentDirectory = $ServerDir
}
if ($result.ReturnValue -ne 0) {
    throw "Win32_Process.Create failed: $($result.ReturnValue)"
}

Write-Output "Started docs MCP pid $($result.ProcessId) on ${Bind}:${Port}"

$probeHost = '127.0.0.1'
if ($Bind -ne '0.0.0.0' -and $Bind -ne '::') {
    $probeHost = $Bind
}

$healthy = $false
for ($attempt = 0; $attempt -lt 20; $attempt++) {
    try {
        $response = Invoke-WebRequest -Uri ("http://" + $probeHost + ":" + $Port + "/health") -UseBasicParsing -TimeoutSec 2
        if ($response.StatusCode -eq 200) {
            $healthy = $true
            break
        }
    } catch {
        Start-Sleep -Milliseconds 500
    }
}

if (-not $healthy) {
    $tail = ''
    if (Test-Path -LiteralPath $log) {
        $tail = Get-Content -LiteralPath $log -Raw -ErrorAction SilentlyContinue
    }
    throw "Docs MCP did not answer on port $Port. Log: $log. $tail"
}

Write-Output "Docs MCP health ok on port $Port"
