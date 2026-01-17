# Скрипт для синхронизации deny.toml во все Rust проекты

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Синхронизация deny.toml во все проекты" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$sourceFile = "deny.toml"
$copied = 0

if (-not (Test-Path $sourceFile)) {
    Write-Host "[ERROR] Исходный файл $sourceFile не найден!" -ForegroundColor Red
    exit 1
}

Write-Host "Копирование $sourceFile во все Rust проекты..." -ForegroundColor Green
Write-Host ""

function Copy-ToProjects {
    param($dir)
    
    Push-Location $dir
    Get-ChildItem -Directory | Where-Object { Test-Path "$($_.Name)\Cargo.toml" } | ForEach-Object {
        $project = $_.Name
        $fullPath = if ($dir -eq ".") { $project } else { "$dir\$project" }
        Write-Host "[$fullPath] Копирование deny.toml..." -ForegroundColor Gray
        try {
            Copy-Item "..\$sourceFile" "$project\deny.toml" -Force
            $script:copied++
        } catch {
            Write-Host "[$fullPath] Ошибка копирования: $_" -ForegroundColor Red
        }
    }
    Pop-Location
}

# Копируем в проекты на текущем уровне
Copy-ToProjects "."

# Копируем во вложенные директории (например !commons)
Get-ChildItem -Directory | ForEach-Object {
    if (Test-Path $_.FullName) {
        Copy-ToProjects $_.Name
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✓ Скопировано в $copied проектов" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

exit 0
