@echo off
setlocal EnableDelayedExpansion

:: One-time setup for static OpenSSL special builds (Linux via Docker).

set "SCRIPT_DIR=%~dp0"
for %%I in ("!SCRIPT_DIR!..") do set "ADDINS_ROOT=%%~fI"
if "!ADDINS_ROOT:~-1!"=="\" set "ADDINS_ROOT=!ADDINS_ROOT:~0,-1!"
for %%I in ("!ADDINS_ROOT!\..\..") do set "REPO_ROOT=%%~fI"
set "DOCKER_DIR=!REPO_ROOT!\ci\docker"
set "COMPOSE_FILE=!DOCKER_DIR!\docker-compose.yml"

where docker >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker not found in PATH. Install Docker Desktop.
    exit /b 1
)

echo [1/3] Checking docker compose...
docker compose version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker compose is not available.
    exit /b 1
)
echo [OK] docker compose found.

echo [2/3] Building zigbuild image ^(Oracle Linux 9^)...
docker compose -f "!COMPOSE_FILE!" --project-directory "!DOCKER_DIR!" build zigbuild
if errorlevel 1 (
    echo [ERROR] Failed to build opi-addins-zigbuild:ol9
    exit /b 1
)
echo [OK] opi-addins-zigbuild:ol9 ready.

echo [3/3] Checking cargo-zigbuild / build tools in image...
docker compose -f "!COMPOSE_FILE!" --project-directory "!DOCKER_DIR!" run --rm --no-deps zigbuild bash -lc "command -v cargo-zigbuild && command -v perl && command -v make && command -v cc"
if errorlevel 1 (
    echo [ERROR] Required tools missing inside zigbuild image.
    exit /b 1
)
echo [OK] cargo-zigbuild, perl, make, cc found.

echo.
echo Setup completed. Next: build-static-openssl.bat or build_all.bat
exit /b 0
