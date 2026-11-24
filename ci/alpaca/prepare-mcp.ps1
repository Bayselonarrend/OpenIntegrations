param()

. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

function Get-NodeValue($Node, [string]$Name) {
    if ($null -eq $Node) { return $null }
    $prop = $Node.PSObject.Properties[$Name]
    if (-not $prop) { return $null }
    return $prop.Value
}

function Get-JsonStrings($Node, $Found) {
    if ($null -eq $Node) { return }
    if ($Node -is [string]) {
        $Found.Add($Node)
        return
    }
    if ($Node -is [System.Collections.IEnumerable] -and -not ($Node -is [string])) {
        foreach ($item in $Node) { Get-JsonStrings $item $Found }
        return
    }
    foreach ($prop in @($Node.PSObject.Properties)) {
        Get-JsonStrings $prop.Value $Found
    }
}

function Resolve-McpPath([string]$Path, [string]$Root) {
    $expanded = $Path.Replace('${workspaceFolder}', $Root).Replace('/', '\')
    if (-not [System.IO.Path]::IsPathRooted($expanded)) {
        $expanded = Join-Path $Root $expanded
    }
    return [System.IO.Path]::GetFullPath($expanded)
}

function Get-McpBlock($Config) {
    $ai = Get-NodeValue (Get-NodeValue $Config 'ai') 'value'
    return Get-NodeValue (Get-NodeValue $ai 'mcp') 'value'
}

function Read-GitShow([string]$Spec) {
    $raw = & git show $Spec
    if ($LASTEXITCODE -ne 0) { return $null }
    if (-not $raw) { return $null }
    return ($raw | Out-String)
}

$root = (Get-Location).Path
$configPath = Join-Path $root 'ci\config_global.json'
$config = $null
if (Test-Path $configPath) {
    $config = ConvertFrom-Json (Read-Utf8File $configPath)
}
$mcp = Get-McpBlock $config
$serversText = $null
if ($null -ne $mcp) {
    $serversRel = [string](Get-NodeValue (Get-NodeValue $mcp 'serversFile') 'value')
    if (-not $serversRel) { throw 'ai.mcp.serversFile is empty' }
    $serversPath = Resolve-McpPath $serversRel $root
    if (-not (Test-Path $serversPath)) { throw "mcpServers file not found: $serversPath" }
    $serversText = Read-Utf8File $serversPath
} else {
    $mainConfig = Read-GitShow 'origin/main:ci/config_global.json'
    if ($mainConfig) {
        $config = ConvertFrom-Json $mainConfig
        $mcp = Get-McpBlock $config
    }
    if ($null -eq $mcp) {
        Write-Output 'MCP settings are absent, skip'
        exit 0
    }
    $serversRel = [string](Get-NodeValue (Get-NodeValue $mcp 'serversFile') 'value')
    if (-not $serversRel) { throw 'ai.mcp.serversFile is empty' }
    $gitPath = ($serversRel -replace '^\./', '') -replace '\\', '/'
    $serversText = Read-GitShow "origin/main:$gitPath"
    if (-not $serversText) { throw "mcpServers file not found on origin/main: $gitPath" }
    Write-Output 'MCP settings taken from origin/main'
}
$servers = ConvertFrom-Json $serversText
$strings = New-Object System.Collections.Generic.List[string]
Get-JsonStrings $servers $strings

$cursorDir = Join-Path $root '.cursor'
New-Item -ItemType Directory -Force -Path $cursorDir | Out-Null
Write-Utf8File (Join-Path $cursorDir 'mcp.json') $serversText

$configDir = Join-Path $PSScriptRoot 'out\cursor-config'
New-Item -ItemType Directory -Force -Path $configDir | Out-Null
$rootUrl = $root.Replace('\', '/')
Write-Utf8File (Join-Path $configDir 'mcp.json') ($serversText.Replace('${workspaceFolder}', $rootUrl))

$downloads = Get-NodeValue (Get-NodeValue $mcp 'downloads') 'value'
foreach ($url in @($downloads)) {
    if (-not $url) { continue }
    $urlText = [string]$url
    $name = [System.IO.Path]::GetFileName(([Uri]$urlText).AbsolutePath)
    if (-not $name) { throw "URL has no file name: $urlText" }
    $match = $null
    foreach ($item in $strings) {
        $leaf = [System.IO.Path]::GetFileName(($item -replace '\$\{workspaceFolder\}', '').Replace('/', '\'))
        if ($leaf -eq $name) { $match = $item; break }
    }
    if (-not $match) { throw "mcpServers has no path for $name" }
    $dest = Resolve-McpPath $match $root
    if ((Test-Path $dest) -and ((Get-Item $dest).Length -gt 0)) {
        Write-Output "MCP file present: $dest"
        continue
    }
    $destDir = Split-Path $dest -Parent
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    $part = "$dest.part"
    if (Test-Path $part) { Remove-Item $part -Force }
    Write-Output "Downloading $urlText"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $urlText -OutFile $part -UseBasicParsing -TimeoutSec 300
    if (-not (Test-Path $part) -or (Get-Item $part).Length -eq 0) { throw "Empty download: $urlText" }
    Move-Item -Force $part $dest
    Write-Output "MCP file saved: $dest"
}

exit 0
