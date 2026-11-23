@echo off
setlocal EnableDelayedExpansion

:: Установить переменную
set CARGO_NAME=opi_ssh
set LIB_NAME=OPI_SSH
set CARGO_FEATURE_ZLIB_NG_COMPAT=1

set "REAL_DIR=%~dp0"
if "%REAL_DIR:~-1%"=="\" set "REAL_DIR=%REAL_DIR:~0,-1%"
for %%I in ("%REAL_DIR%\..") do set "REAL_ADDINS=%%~fI"

:: Short junction of the whole addins tree: vendored OpenSSL Configure fails on
:: long Jenkins workspace paths, and path deps (../commons) must still resolve.
set "SHORT_ADDINS=C:\opi-build\addins"
if not exist "C:\opi-build" mkdir "C:\opi-build"
if exist "%SHORT_ADDINS%" rmdir "%SHORT_ADDINS%" >nul 2>&1
mklink /J "%SHORT_ADDINS%" "%REAL_ADDINS%" >nul
if errorlevel 1 (
    echo [ERROR] Failed to create junction %SHORT_ADDINS% -^> %REAL_ADDINS%
    exit /b 1
)

set "ADDIN_DIR=%SHORT_ADDINS%\ssh"
call "%REAL_ADDINS%\build.bat"
set "EXITCODE=%ERRORLEVEL%"

rmdir "%SHORT_ADDINS%" >nul 2>&1
exit /b %EXITCODE%
