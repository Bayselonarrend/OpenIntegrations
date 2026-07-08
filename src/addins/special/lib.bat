@echo off
setlocal EnableDelayedExpansion

:: Shared helpers for special add-in builds.

goto :eof

:validate_arch
set "ARCH=%~1"
if "!ARCH!"=="" set "ARCH=both"
if /I "!ARCH!"=="x64" exit /b 0
if /I "!ARCH!"=="x86" exit /b 0
if /I "!ARCH!"=="both" exit /b 0
echo [ERROR] Unknown architecture: !ARCH!
exit /b 2

:require_cargo
where cargo >nul 2>&1
if errorlevel 1 (
    echo [ERROR] cargo not found in PATH.
    exit /b 1
)
exit /b 0

:require_powershell
where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)
exit /b 0

:require_wsl
where wsl >nul 2>&1
if errorlevel 1 (
    echo [ERROR] wsl not found in PATH.
    exit /b 1
)
wsl -d OracleLinux_9_1 -- echo WSL OK >nul 2>&1
if errorlevel 1 (
    echo [ERROR] WSL distro OracleLinux_9_1 is not available.
    exit /b 1
)
exit /b 0

:ensure_output_dir
if not defined OPI_SPECIAL_OUTPUT (
    for %%I in ("%~dp0.") do set "OPI_SPECIAL_OUTPUT=%%~fI\output"
)
if not exist "!OPI_SPECIAL_OUTPUT!" mkdir "!OPI_SPECIAL_OUTPUT!" >nul 2>&1
if errorlevel 1 exit /b 1
exit /b 0

:write_manifest
:: Expects: BUNDLE_DIR, LIB_NAME, PLATFORM (win7|static-openssl), HAS_X64, HAS_X86
(
echo ^<?xml version='1.0' encoding='UTF-8'?^>
echo ^<bundle xmlns='http://v8.1c.ru/8.2/addin/bundle' name='!LIB_NAME!'^>
) > "!BUNDLE_DIR!\MANIFEST.XML"

if /I "!PLATFORM!"=="win7" (
    if "!HAS_X86!"=="1" echo   ^<component os='Windows' path='AddIn_!LIB_NAME!_x86_windows.dll' type='native' arch='i386' /^> >> "!BUNDLE_DIR!\MANIFEST.XML"
    if "!HAS_X64!"=="1" echo   ^<component os='Windows' path='AddIn_!LIB_NAME!_x64_windows.dll' type='native' arch='x86_64' /^> >> "!BUNDLE_DIR!\MANIFEST.XML"
) else if /I "!PLATFORM!"=="static-openssl" (
    if "!HAS_X86!"=="1" echo   ^<component os='Linux' path='AddIn_!LIB_NAME!_x86_linux.so' type='native' arch='i386' /^> >> "!BUNDLE_DIR!\MANIFEST.XML"
    if "!HAS_X64!"=="1" echo   ^<component os='Linux' path='AddIn_!LIB_NAME!_x64_linux.so' type='native' arch='x86_64' /^> >> "!BUNDLE_DIR!\MANIFEST.XML"
) else (
    echo [ERROR] Unknown platform: !PLATFORM!
    exit /b 1
)

echo ^</bundle^> >> "!BUNDLE_DIR!\MANIFEST.XML"
exit /b 0

:pack_zip
if not exist "!BUNDLE_DIR!" (
    echo [ERROR] Bundle directory not found: !BUNDLE_DIR!
    exit /b 1
)
if exist "!ZIP_PATH!" del /F /Q "!ZIP_PATH!" >nul 2>&1
powershell -NoProfile -Command "Compress-Archive -Path '!BUNDLE_DIR!\*' -DestinationPath '!ZIP_PATH!' -Force"
if errorlevel 1 exit /b 1
echo [OK] !ZIP_PATH!
exit /b 0
