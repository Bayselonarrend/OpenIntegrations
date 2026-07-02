@echo off
setlocal

:: Builds one addin for Linux with statically linked OpenSSL 3.x and packs zip bundle.
:: Usage:
::   build-static-openssl-package.bat <component_dir> <cargo_name> <lib_name> [x64|x86|both]
::
:: Supported components (OpenSSL on Linux):
::   tcp_client, mysql, postgres, ssh
::
:: Example for SSH:
::   build-static-openssl-package.bat ssh opi_ssh OPI_SSH x64

if "%~1"=="" goto :usage
if "%~2"=="" goto :usage
if "%~3"=="" goto :usage

set "COMPONENT_DIR=%~1"
set "CARGO_NAME=%~2"
set "LIB_NAME=%~3"
set "ARCH=%~4"
if "%ARCH%"=="" set "ARCH=x64"
if /I "%ARCH%"=="x64" goto :arch_ok
if /I "%ARCH%"=="x86" goto :arch_ok
if /I "%ARCH%"=="both" goto :arch_ok
echo [ERROR] Unknown architecture: %ARCH%
goto :usage
:arch_ok

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "ADDINS_DIR=%%~fI"
set "COMPONENT_PATH=%ADDINS_DIR%\%COMPONENT_DIR%"
set "CARGO_TOML=%COMPONENT_PATH%\Cargo.toml"

set "ARTIFACT_DIR=%SCRIPT_DIR%artifacts\%LIB_NAME%"
set "BUNDLE_DIR=%ARTIFACT_DIR%\bundle"
set "SO_BUNDLE_X64=AddIn_%LIB_NAME%_x64_linux.so"
set "SO_BUNDLE_X86=AddIn_%LIB_NAME%_x86_linux.so"
set "ZIP_PATH=%ARTIFACT_DIR%\%LIB_NAME%_static_openssl_%ARCH%.zip"

if not exist "%CARGO_TOML%" (
    echo [ERROR] Cargo.toml not found: %CARGO_TOML%
    exit /b 1
)

where wsl >nul 2>&1
if errorlevel 1 (
    echo [ERROR] wsl not found in PATH.
    exit /b 1
)

where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)

wsl -d OracleLinux_9_1 -- echo WSL OK >nul 2>&1
if errorlevel 1 (
    echo [ERROR] WSL distro OracleLinux_9_1 is not available.
    exit /b 1
)

if exist "%BUNDLE_DIR%" rmdir /S /Q "%BUNDLE_DIR%"
mkdir "%BUNDLE_DIR%" >nul 2>&1
if errorlevel 1 goto :error

set "HAS_X64=0"
set "HAS_X86=0"

pushd "%COMPONENT_PATH%"
if errorlevel 1 goto :error

if /I "%ARCH%"=="x64" call :build_x64
if /I "%ARCH%"=="x86" call :build_x86
if /I "%ARCH%"=="both" call :build_x64
if /I "%ARCH%"=="both" call :build_x86
if errorlevel 1 (
    popd
    goto :error
)

popd

(
echo ^<?xml version='1.0' encoding='UTF-8'?^>
echo ^<bundle xmlns='http://v8.1c.ru/8.2/addin/bundle' name='%LIB_NAME%'^>
if "%HAS_X86%"=="1" echo   ^<component os='Linux' path='%SO_BUNDLE_X86%' type='native' arch='i386' /^>
if "%HAS_X64%"=="1" echo   ^<component os='Linux' path='%SO_BUNDLE_X64%' type='native' arch='x86_64' /^>
echo ^</bundle^>
) > "%BUNDLE_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

if not exist "%ARTIFACT_DIR%" mkdir "%ARTIFACT_DIR%" >nul 2>&1
if exist "%ZIP_PATH%" del /F /Q "%ZIP_PATH%" >nul 2>&1

powershell -NoProfile -Command "Compress-Archive -Path '%BUNDLE_DIR%\*' -DestinationPath '%ZIP_PATH%' -Force"
if errorlevel 1 goto :error

echo.
echo [OK] Package created:
echo      %ZIP_PATH%
echo.
echo Install this zip as external component package or replace Linux .so in your release zip.
exit /b 0

:usage
echo Usage: build-static-openssl-package.bat ^<component_dir^> ^<cargo_name^> ^<lib_name^> [x64^|x86^|both]
echo.
echo Supported components: tcp_client, mysql, postgres, ssh
echo.
echo Example x64 : build-static-openssl-package.bat ssh opi_ssh OPI_SSH x64
echo Example x86 : build-static-openssl-package.bat ssh opi_ssh OPI_SSH x86
echo Example both: build-static-openssl-package.bat ssh opi_ssh OPI_SSH both
exit /b 2

:error
echo [ERROR] Build or packaging failed.
exit /b 1

:build_x64
set "TARGET=x86_64-unknown-linux-gnu.2.17"
set "SO_SOURCE=target\x86_64-unknown-linux-gnu\release\lib%CARGO_NAME%.so"
echo Building %LIB_NAME% from %COMPONENT_DIR% for %TARGET% with vendored OpenSSL...
wsl -d OracleLinux_9_1 -- bash -lc "cargo zigbuild --release --target %TARGET% --features vendored-openssl"
if errorlevel 1 exit /b 1
if not exist "%SO_SOURCE%" (
    echo [ERROR] Built .so not found: %SO_SOURCE%
    exit /b 1
)
copy /Y "%SO_SOURCE%" "%BUNDLE_DIR%\%SO_BUNDLE_X64%" >nul
if errorlevel 1 exit /b 1
set "HAS_X64=1"
exit /b 0

:build_x86
set "TARGET=i686-unknown-linux-gnu.2.17"
set "SO_SOURCE=target\i686-unknown-linux-gnu\release\lib%CARGO_NAME%.so"
echo Building %LIB_NAME% from %COMPONENT_DIR% for %TARGET% with vendored OpenSSL...
wsl -d OracleLinux_9_1 -- bash -lc "cargo zigbuild --release --target %TARGET% --features vendored-openssl"
if errorlevel 1 exit /b 1
if not exist "%SO_SOURCE%" (
    echo [ERROR] Built .so not found: %SO_SOURCE%
    exit /b 1
)
copy /Y "%SO_SOURCE%" "%BUNDLE_DIR%\%SO_BUNDLE_X86%" >nul
if errorlevel 1 exit /b 1
set "HAS_X86=1"
exit /b 0
