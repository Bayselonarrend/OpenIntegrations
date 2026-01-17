# Скрипт для автоматического обновления NOTICE файла на основе cargo about

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Обновление NOTICE файла" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$noticeFile = "..\..\NOTICE"
$templateFile = "..\..\service\templates\notice.txt"

# Проверяем наличие cargo-about
try {
    $null = Get-Command cargo-about -ErrorAction Stop
} catch {
    Write-Host "[ERROR] cargo-about не установлен!" -ForegroundColor Red
    Write-Host "Установите его командой: cargo install cargo-about" -ForegroundColor Yellow
    exit 1
}

# Проверяем наличие шаблона
if (-not (Test-Path $templateFile)) {
    Write-Host "[ERROR] Шаблон не найден: $templateFile" -ForegroundColor Red
    exit 1
}

Write-Host "Собираем информацию о зависимостях..." -ForegroundColor Green
Write-Host ""

# Собираем все зависимости
$allDependencies = @()

function Process-Projects {
    param($dir)
    
    Push-Location $dir
    Get-ChildItem -Directory | Where-Object { Test-Path "$($_.Name)\Cargo.toml" } | ForEach-Object {
        $project = $_.Name
        $fullPath = if ($dir -eq ".") { $project } else { "$dir\$project" }
        Write-Host "[$fullPath] Обработка..." -ForegroundColor Gray
        Push-Location $project
        try {
            $tempFile = "..\temp_$project.txt"
            cargo about generate --config ..\about.toml -o $tempFile ..\about.hbs 2>&1 | Out-Null
            if (Test-Path $tempFile) {
                $content = Get-Content $tempFile -Encoding UTF8
                $script:allDependencies += $content
                Remove-Item $tempFile
            }
        } catch {
            Write-Host "[$fullPath] Предупреждение: $_" -ForegroundColor Yellow
        }
        Pop-Location
    }
    Pop-Location
}

# Обрабатываем проекты на текущем уровне
Process-Projects "."

# Обрабатываем вложенные директории (например !commons)
Get-ChildItem -Directory | ForEach-Object {
    if (Test-Path $_.FullName) {
        Process-Projects $_.Name
    }
}

Write-Host ""
Write-Host "Удаляем дубликаты и форматируем..." -ForegroundColor Green

# Обрабатываем зависимости: удаляем дубликаты, сортируем и форматируем
$uniqueDeps = $allDependencies | 
    Where-Object { $_.Trim() -ne "" } | 
    Select-Object -Unique | 
    Sort-Object

$formatted = $uniqueDeps | ForEach-Object {
    $parts = $_ -split '\|'
    if ($parts.Count -eq 5) {
        "Используется библиотека $($parts[0]) v$($parts[1])`n * $($parts[2])`n * Licensed under the $($parts[3])`n * $($parts[4])`n"
    }
}

# Читаем шаблон
$templateContent = Get-Content $templateFile -Raw -Encoding UTF8

# Формируем содержимое NOTICE файла
$noticeContent = $templateContent

if (-not $noticeContent.EndsWith("`n")) {
    $noticeContent += "`n"
}

$noticeContent += @"

========================================
Rust зависимости из аддинов:
========================================

"@

if ($formatted.Count -gt 0) {
    $noticeContent += ($formatted -join "`n")
} else {
    $noticeContent += "Нет внешних зависимостей"
}

# Сохраняем файл с UTF-8 кодировкой
Write-Host "Создаем новый NOTICE файл..." -ForegroundColor Green
$noticeContent | Out-File -FilePath $noticeFile -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✓ NOTICE файл успешно обновлен!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Найдено уникальных зависимостей: $($uniqueDeps.Count)" -ForegroundColor Cyan

exit 0
