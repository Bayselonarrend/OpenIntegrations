@echo off
setlocal enabledelayedexpansion

echo Checking licenses for Rust projects
echo.

set "FAILED=0"
set "SUCCESS=0"

:: Проверяем проекты на текущем уровне
for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo [%%P] Checking licenses...
        cd %%P
        cargo deny check licenses
        if !ERRORLEVEL! EQU 0 (
            echo [%%P] ✓ OK
            set /a SUCCESS+=1
        ) else (
            echo [%%P] ✗ FAILED
            set /a FAILED+=1
        )
        cd ..
        echo.
    )
)

:: Проверяем вложенные директории
for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo [%%D\%%~nxP] Checking licenses...
                cd "%%P"
                cargo deny check licenses
                if !ERRORLEVEL! EQU 0 (
                    echo [%%D\%%~nxP] ✓ OK
                    set /a SUCCESS+=1
                ) else (
                    echo [%%D\%%~nxP] ✗ FAILED
                    set /a FAILED+=1
                )
                cd ..\..
                echo.
            )
        )
    )
)

echo ========================================
echo Summary:
echo   Success: %SUCCESS%
echo   Failed:  %FAILED%
echo ========================================

if %FAILED% GTR 0 (
    exit /b 1
)

exit /b 0
