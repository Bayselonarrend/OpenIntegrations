@echo off
setlocal EnableDelayedExpansion

set "ADDINS_ROOT=%~dp0"
if "%ADDINS_ROOT:~-1%"=="\" set "ADDINS_ROOT=%ADDINS_ROOT:~0,-1%"
for %%I in ("%ADDINS_ROOT%\..\..") do set "REPO_ROOT=%%~fI"
set "DOCKER_DIR=%REPO_ROOT%\ci\docker"
set "COMPOSE_FILE=%DOCKER_DIR%\docker-compose.yml"

where docker >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker not found in PATH. Install Docker Desktop and retry.
    exit /b 1
)

echo.
echo ========================================
echo Building Docker images...
echo ========================================
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" build
if errorlevel 1 (
    echo ERROR: Docker image build failed
    exit /b 1
)

for /d %%p in (*) do (
    if /I "%%p"=="commons" (
        rem skip shared crates
    ) else if /I "%%p"=="special" (
        rem special builds have their own build_all.bat
    ) else if exist "%%p\release.bat" (
        echo.
        echo ========================================
        echo Building %%p...
        echo ========================================

        pushd %%p
        call release.bat
        if errorlevel 1 (
            echo ERROR: Build failed for %%p
            popd
            exit /b 1
        )
        popd
    )
)

echo.
echo ========================================
echo All projects built successfully!
echo ========================================
exit /b 0
