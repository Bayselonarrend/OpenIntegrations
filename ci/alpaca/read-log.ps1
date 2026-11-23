param(
    [Parameter(Mandatory = $true)][string]$Job,
    [Parameter(Mandatory = $true)][string]$Number,
    [Parameter(Mandatory = $true)][string]$OutFile,
    [int]$Lines = 500
)

$ErrorActionPreference = 'Stop'
if ($Job -notmatch '^[A-Za-z0-9_./]+$') { throw "Bad job name: $Job" }
if ($Number -notmatch '^[0-9]+$') { throw "Bad build number: $Number" }
if ($Lines -lt 1 -or $Lines -gt 5000) { throw "Bad line count: $Lines" }

. (Join-Path $PSScriptRoot 'common.ps1')

function Get-JenkinsHome {
    if ($env:JENKINS_HOME -and (Test-Path -LiteralPath $env:JENKINS_HOME)) {
        return $env:JENKINS_HOME
    }
    if ($env:WORKSPACE) {
        $parent = Split-Path (Split-Path $env:WORKSPACE -Parent) -Parent
        if ($parent -and (Test-Path -LiteralPath (Join-Path $parent 'jobs'))) {
            return $parent
        }
    }
    $local = Join-Path $env:LOCALAPPDATA 'Jenkins\.jenkins'
    if (Test-Path -LiteralPath $local) { return $local }
    return $null
}

function Read-TailText([string]$Path, [int]$LineCount) {
    $fs = New-Object System.IO.FileStream($Path, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
    try {
        $length = $fs.Length
        $take = [Math]::Min($length, 2097152)
        [void]$fs.Seek($length - $take, [System.IO.SeekOrigin]::Begin)
        $buf = New-Object byte[] $take
        $read = $fs.Read($buf, 0, $take)
        $text = [System.Text.Encoding]::UTF8.GetString($buf, 0, $read)
    } finally {
        $fs.Close()
    }
    $rows = @($text -split "`r?`n")
    if ($rows.Length -gt $LineCount) {
        $rows = @($rows | Select-Object -Last $LineCount)
    }
    return ($rows -join "`n")
}

$home = Get-JenkinsHome
$text = $null
if ($home) {
    $rel = (@($Job -split '/') | ForEach-Object { "jobs\$_" }) -join '\'
    $logPath = Join-Path $home "$rel\builds\$Number\log"
    if (Test-Path -LiteralPath $logPath) {
        $text = Read-TailText $logPath $Lines
    }
}
if (-not $text) {
    $jobPath = (@($Job -split '/') | ForEach-Object { "job/$_" }) -join '/'
    foreach ($base in @('http://127.0.0.1:8080', 'http://100.74.74.9:8080')) {
        try {
            $resp = Invoke-WebRequest -UseBasicParsing -Uri "$base/$jobPath/$Number/consoleText" -TimeoutSec 60
            if ($resp.Content) {
                $text = [string]$resp.Content
                break
            }
        } catch {
        }
    }
    if ($text) {
        $rows = @($text -split "`r?`n")
        if ($rows.Length -gt $Lines) {
            $rows = @($rows | Select-Object -Last $Lines)
        }
        $text = $rows -join "`n"
    }
}
if (-not $text) { throw "log unavailable for $Job #$Number" }
Write-Utf8File $OutFile ($text.TrimEnd() + "`n")
