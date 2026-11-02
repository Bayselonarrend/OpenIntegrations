@echo off

:: Shared helpers for special add-in builds.
:: Invoked as: call "%~dp0lib.bat" <label> [args]

if "%~1"=="" exit /b 1
goto %~1

:validate_arch
setlocal EnableDelayedExpansion
set "ARCH=%~2"
if "!ARCH!"=="" set "ARCH=both"
if /I "!ARCH!"=="x64" exit /b 0
if /I "!ARCH!"=="x86" exit /b 0
if /I "!ARCH!"=="both" exit /b 0
echo [ERROR] Unknown architecture: !ARCH!
exit /b 2

:require_cargo
setlocal EnableDelayedExpansion
where cargo >nul 2>&1
if errorlevel 1 (
    echo [ERROR] cargo not found in PATH.
    exit /b 1
)
exit /b 0

:require_powershell
setlocal EnableDelayedExpansion
where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)
exit /b 0

:require_docker
setlocal EnableDelayedExpansion
where docker >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker not found in PATH. Install Docker Desktop.
    exit /b 1
)
docker compose version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker compose is not available.
    exit /b 1
)
docker image inspect opi-addins-zigbuild:ol9 >nul 2>&1
if errorlevel 1 (
    echo [INFO] Building opi-addins-zigbuild:ol9...
    for %%I in ("%~dp0..") do set "ADDINS_ROOT=%%~fI"
    if "!ADDINS_ROOT:~-1!"=="\" set "ADDINS_ROOT=!ADDINS_ROOT:~0,-1!"
    for %%I in ("!ADDINS_ROOT!\..\..") do set "REPO_ROOT=%%~fI"
    set "DOCKER_DIR=!REPO_ROOT!\ci\docker"
    docker compose -f "!DOCKER_DIR!\docker-compose.yml" --project-directory "!DOCKER_DIR!" build zigbuild
    if errorlevel 1 exit /b 1
)
exit /b 0

:require_wsl
:: Backward-compatible alias — Linux builds use Docker now
goto require_docker

:ensure_output_dir
setlocal EnableDelayedExpansion
if not defined OPI_SPECIAL_OUTPUT (
    for %%I in ("%~dp0.") do set "OPI_SPECIAL_OUTPUT=%%~fI\output"
)
if not exist "!OPI_SPECIAL_OUTPUT!" mkdir "!OPI_SPECIAL_OUTPUT!" >nul 2>&1
if errorlevel 1 exit /b 1
endlocal & set "OPI_SPECIAL_OUTPUT=%OPI_SPECIAL_OUTPUT%"
exit /b 0

:write_manifest
setlocal EnableDelayedExpansion
if not defined BUNDLE_DIR (
    echo [ERROR] BUNDLE_DIR is not set.
    exit /b 1
)
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
setlocal EnableDelayedExpansion
if not defined BUNDLE_DIR (
    echo [ERROR] BUNDLE_DIR is not set.
    exit /b 1
)
if not defined ZIP_PATH (
    echo [ERROR] ZIP_PATH is not set.
    exit /b 1
)
if not exist "!BUNDLE_DIR!" (
    echo [ERROR] Bundle directory not found: !BUNDLE_DIR!
    exit /b 1
)
if exist "!ZIP_PATH!" del /F /Q "!ZIP_PATH!" >nul 2>&1
powershell -NoProfile -Command "Compress-Archive -Path '!BUNDLE_DIR!\*' -DestinationPath '!ZIP_PATH!' -Force"
if errorlevel 1 exit /b 1
if not exist "!ZIP_PATH!" (
    echo [ERROR] Zip was not created: !ZIP_PATH!
    exit /b 1
)
echo [OK] !ZIP_PATH!
exit /b 0
