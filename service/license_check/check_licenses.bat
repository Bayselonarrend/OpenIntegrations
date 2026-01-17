@echo off
setlocal enabledelayedexpansion

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\.."
set "ADDINS_DIR=%ROOT_DIR%\src\addins"

where cargo-deny >nul 2>&1
if !ERRORLEVEL! NEQ 0 (
    echo cargo-deny not found!
    echo Call: cargo install cargo-deny
    exit /b 1
)

echo Checking licenses for Rust projects
echo.

set "FAILED=0"
set "SUCCESS=0"

cd /d "%ADDINS_DIR%"

for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo [%%P] Checking licenses...
        pushd "%%P"
        cargo deny check licenses
        if !ERRORLEVEL! EQU 0 (
            echo [%%P] OK
            set /a SUCCESS+=1
        ) else (
            echo [%%P] FAILED
            set /a FAILED+=1
        )
        popd
        echo.
    )
)

for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo [%%D\%%~nxP] Checking licenses...
                pushd "%%P"
                cargo deny check licenses
                if !ERRORLEVEL! EQU 0 (
                    echo [%%D\%%~nxP] OK
                    set /a SUCCESS+=1
                ) else (
                    echo [%%D\%%~nxP] FAILED
                    set /a FAILED+=1
                )
                popd
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
