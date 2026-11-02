@echo off
setlocal EnableDelayedExpansion

:: %~dp0 ends with \ — strip it so "--project-directory "...\"" does not escape the quote
set "ADDINS_ROOT=%~dp0"
if "%ADDINS_ROOT:~-1%"=="\" set "ADDINS_ROOT=%ADDINS_ROOT:~0,-1%"
for %%I in ("%ADDINS_ROOT%\..\..") do set "REPO_ROOT=%%~fI"
set "DOCKER_DIR=%REPO_ROOT%\ci\docker"
set "COMPOSE_FILE=%DOCKER_DIR%\docker-compose.yml"
if not defined CARGO_EXTRA set "CARGO_EXTRA="
if defined WSL_EXTRA_ENV if not defined LINUX_EXTRA_ENV set "LINUX_EXTRA_ENV=%WSL_EXTRA_ENV%"
if not defined LINUX_EXTRA_ENV set "LINUX_EXTRA_ENV="

:: Перейти в директорию проекта
cd /d "%ADDIN_DIR%"
if errorlevel 1 goto :error

for %%I in ("%CD%") do set "ADDIN_FOLDER=%%~nxI"

:: Один target/ для host и Docker (иначе Cursor sandbox CARGO_TARGET_DIR разъезжается с volume)
set "CARGO_TARGET_DIR=%CD%\target"

:: Создать папку для артефактов
set "OUTPUT_DIR=artifacts"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

call :ensure_docker
if errorlevel 1 goto :error

:: СБОРКА ОСНОВНОЙ ВЕРСИИ ----------------------------------------------------------------------------------------------
:: Windows: Schannel / vendored OpenSSL (ssh2) — vcpkg не нужен
:: Linux: системный OpenSSL из Docker-образа (OPENSSL_DIR=/usr)

:: Сборка для x86_64-pc-windows-msvc
cargo build --release --target x86_64-pc-windows-msvc %CARGO_EXTRA%
if errorlevel 1 goto :error

:: Сборка для x86_64-unknown-linux-gnu (Docker / Oracle Linux 9 + zigbuild)
call :docker_zigbuild_x64
if errorlevel 1 goto :error

:: Сборка для i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc %CARGO_EXTRA%
if errorlevel 1 goto :error

:: Сборка для i686-unknown-linux-gnu (Docker / Oracle Linux 9 + zigbuild)
call :docker_zigbuild_x86
if errorlevel 1 goto :error

:: Имена файлов в zip — без префикса OPI_; name в манифесте = полный LIB_NAME
set "FILE_PREFIX=%LIB_NAME%"
set "DLL_WIN64=AddIn_%FILE_PREFIX%_x64_windows.dll"
set "DLL_WIN86=AddIn_%FILE_PREFIX%_x86_windows.dll"
set "SO_LIN64=AddIn_%FILE_PREFIX%_x64_linux.so"
set "SO_LIN86=AddIn_%FILE_PREFIX%_x86_linux.so"

:: Копирование файлов .dll и .so
copy /y "target\x86_64-pc-windows-msvc\release\%CARGO_NAME%.dll" "%OUTPUT_DIR%\%DLL_WIN64%"
if errorlevel 1 goto :error

copy /y "target\i686-pc-windows-msvc\release\%CARGO_NAME%.dll" "%OUTPUT_DIR%\%DLL_WIN86%"
if errorlevel 1 goto :error

copy /y "target\x86_64-unknown-linux-gnu\release\lib%CARGO_NAME%.so" "%OUTPUT_DIR%\%SO_LIN64%"
if errorlevel 1 goto :error

copy /y "target\i686-unknown-linux-gnu\release\lib%CARGO_NAME%.so" "%OUTPUT_DIR%\%SO_LIN86%"
if errorlevel 1 goto :error

(
echo ^<?xml version='1.0' encoding='UTF-8'?^>
echo ^<bundle xmlns='http://v8.1c.ru/8.2/addin/bundle' name='%LIB_NAME%'^>
echo 	^<component os='Windows' path='%DLL_WIN86%' type='native' arch='i386' /^>
echo 	^<component os='Windows' path='%DLL_WIN64%' type='native' arch='x86_64' /^>
echo 	^<component os='Linux' path='%SO_LIN86%' type='native' arch='i386' /^>
echo 	^<component os='Linux' path='%SO_LIN64%' type='native' arch='x86_64' /^>
echo ^</bundle^>
) > "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

echo "MAIN ---" > dependencies.log
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" run --rm --no-deps zigbuild bash -lc "ldd /addins/%ADDIN_FOLDER%/%OUTPUT_DIR%/%SO_LIN64%" >> dependencies.log
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" run --rm --no-deps zigbuild bash -lc "strings /addins/%ADDIN_FOLDER%/%OUTPUT_DIR%/%SO_LIN64% | grep GLIBC_ || true" >> dependencies.log

:: Архивация
powershell -Command "Compress-Archive -Path '%OUTPUT_DIR%\*' -Force -DestinationPath '%LIB_NAME%.zip'"
if errorlevel 1 goto :error

copy /y "%LIB_NAME%.zip" "../../ru/OInt/addins/%LIB_NAME%.zip"
copy /y "%LIB_NAME%.zip" "../../en/OInt/addins/%LIB_NAME%.zip"

copy /y "%LIB_NAME%.zip" "../../ru/BSL/OpenIntegrations/src/CommonTemplates/%LIB_NAME%/Template.addin"
copy /y "%LIB_NAME%.zip" "../../en/BSL/OpenIntegrations/src/CommonTemplates/%LIB_NAME%/Template.addin"

if exist "%OUTPUT_DIR%" (
    rmdir /S /Q "%OUTPUT_DIR%"
)

del "%LIB_NAME%.zip"

@echo (MAIN) Build and packaging completed successfully.
exit /b 0

:error
@echo (MAIN) An error occurred during the build or packaging process.
exit /b 1

:ensure_docker
where docker >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker not found in PATH. Install Docker Desktop and retry.
    exit /b 1
)
docker compose version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker compose is not available.
    exit /b 1
)
docker image inspect opi-addins-zigbuild:ol9 >nul 2>&1
if errorlevel 1 goto :build_images
exit /b 0

:build_images
echo Building Docker images for addins ^(first run or outdated^)...
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" build
exit /b %ERRORLEVEL%

:docker_env_args
set "DOCKER_ENV_ARGS="
if defined CARGO_FEATURE_ZLIB_NG_COMPAT set "DOCKER_ENV_ARGS=-e CARGO_FEATURE_ZLIB_NG_COMPAT=%CARGO_FEATURE_ZLIB_NG_COMPAT%"
exit /b 0

:docker_zigbuild_x64
call :docker_env_args
:: bash -lc: Unix-пути не ломаются cmd/Docker Desktop path conversion
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" run --rm --no-deps %DOCKER_ENV_ARGS% zigbuild bash -lc "cd /addins/%ADDIN_FOLDER% && export LIBRARY_PATH=/usr/lib64 OPENSSL_DIR=/usr %LINUX_EXTRA_ENV% && cargo zigbuild --release --target x86_64-unknown-linux-gnu.2.17 %CARGO_EXTRA%"
exit /b %ERRORLEVEL%

:docker_zigbuild_x86
call :docker_env_args
docker compose -f "%COMPOSE_FILE%" --project-directory "%DOCKER_DIR%" run --rm --no-deps %DOCKER_ENV_ARGS% zigbuild bash -lc "cd /addins/%ADDIN_FOLDER% && export LIBRARY_PATH=/usr/lib OPENSSL_DIR=/usr OPENSSL_LIB_DIR=/usr/lib OPENSSL_INCLUDE_DIR=/usr/include %LINUX_EXTRA_ENV% && cargo zigbuild --release --target i686-unknown-linux-gnu.2.17 %CARGO_EXTRA%"
exit /b %ERRORLEVEL%
