@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo Обновление NOTICE файла
echo ========================================
echo.

set "TEMP_FILE=%CD%\temp_dependencies.txt"
set "NOTICE_FILE=..\..\NOTICE"
set "TEMPLATE_FILE=..\..\service\templates\notice.txt"
set "ABOUT_CONFIG=%CD%\about.toml"
set "ABOUT_TEMPLATE=%CD%\about.hbs"

:: Проверяем наличие cargo-about
where cargo-about >nul 2>&1
if !ERRORLEVEL! NEQ 0 (
    echo [ERROR] cargo-about не установлен!
    echo Установите его командой: cargo install cargo-about
    exit /b 1
)

:: Проверяем наличие шаблона
if not exist "%TEMPLATE_FILE%" (
    echo [ERROR] Шаблон не найден: %TEMPLATE_FILE%
    exit /b 1
)

:: Создаем временный файл для сбора зависимостей
if exist "%TEMP_FILE%" del "%TEMP_FILE%"
echo. > "%TEMP_FILE%"

echo Собираем информацию о зависимостях...
echo.

:: Обрабатываем проекты на текущем уровне
for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo [%%P] Обработка...
        cd %%P
        set "PROJECT_OUT=%TEMP_FILE%.%%P"
        cargo about generate --config "%ABOUT_CONFIG%" -o "!PROJECT_OUT!" "%ABOUT_TEMPLATE%" 2>nul
        if exist "!PROJECT_OUT!" (
            type "!PROJECT_OUT!" >> "%TEMP_FILE%"
            del "!PROJECT_OUT!"
        )
        cd ..
    )
)

:: Обрабатываем вложенные директории
for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo [%%D\%%~nxP] Обработка...
                cd "%%P"
                set "PROJECT_OUT=%TEMP_FILE%.%%~nxP"
                cargo about generate --config "%ABOUT_CONFIG%" -o "!PROJECT_OUT!" "%ABOUT_TEMPLATE%" 2>nul
                if exist "!PROJECT_OUT!" (
                    type "!PROJECT_OUT!" >> "%TEMP_FILE%"
                    del "!PROJECT_OUT!"
                )
                cd ..\..
            )
        )
    )
)

echo.
echo Удаляем дубликаты и форматируем...

:: Обрабатываем через PowerShell: удаляем дубликаты, сортируем и форматируем
powershell -Command "$content = Get-Content '%TEMP_FILE%' -Encoding UTF8 | Where-Object { $_.Trim() -ne '' }; $unique = $content | Select-Object -Unique | Sort-Object; $formatted = $unique | ForEach-Object { $parts = $_ -split '\|'; if ($parts.Count -eq 5) { \"Используется библиотека $($parts[0]) v$($parts[1])`n * $($parts[2])`n * Licensed under the $($parts[3])`n * $($parts[4])`n\" } }; $formatted | Out-File '%TEMP_FILE%.sorted' -Encoding UTF8"

:: Создаем новый NOTICE файл
echo Создаем новый NOTICE файл...

(
type "%TEMPLATE_FILE%"
echo.
echo ========================================
echo Rust зависимости из аддинов:
echo ========================================
echo.
type "%TEMP_FILE%.sorted"
) > "%NOTICE_FILE%"

:: Очистка
del "%TEMP_FILE%" 2>nul
del "%TEMP_FILE%.sorted" 2>nul

echo.
echo ========================================
echo ✓ NOTICE файл успешно обновлен!
echo ========================================

exit /b 0
