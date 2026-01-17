@echo off
setlocal enabledelayedexpansion

echo Sync deny.toml

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\.."
set "ADDINS_DIR=%ROOT_DIR%\src\addins"
set "SOURCE_FILE=%SCRIPT_DIR%deny.toml"
set "COPIED=0"

if not exist "%SOURCE_FILE%" (
    echo [ERROR] Original deny.toml not found!
    exit /b 1
)

cd /d "%ADDINS_DIR%"

for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo [%%P] Copy deny.toml...
        copy /Y "%SOURCE_FILE%" "%%P\deny.toml" >nul
        if !ERRORLEVEL! EQU 0 (
            set /a COPIED+=1
        )
    )
)

for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo [%%D\%%~nxP] Copy deny.toml...
                copy /Y "%SOURCE_FILE%" "%%P\deny.toml" >nul
                if !ERRORLEVEL! EQU 0 (
                    set /a COPIED+=1
                )
            )
        )
    )
)

echo.
echo Success

exit /b 0
