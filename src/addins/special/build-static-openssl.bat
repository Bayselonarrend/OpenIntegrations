@echo off
setlocal EnableDelayedExpansion

:: Builds one addin for Linux with statically linked OpenSSL 3.x.
:: Usage: build-static-openssl.bat <component_dir> <cargo_name> <lib_name> [both|x64|x86]

if "%~3"=="" goto :usage

set "COMPONENT_DIR=%~1"
set "CARGO_NAME=%~2"
set "LIB_NAME=%~3"
set "ARCH=%~4"
if "!ARCH!"=="" set "ARCH=both"

set "SCRIPT_DIR=%~dp0"
for %%I in ("!SCRIPT_DIR!..") do set "ADDINS_DIR=%%~fI"
set "COMPONENT_PATH=!ADDINS_DIR!\!COMPONENT_DIR!"
set "CARGO_TOML=!COMPONENT_PATH!\Cargo.toml"

call "!SCRIPT_DIR!lib.bat" :validate_arch "!ARCH!"
if errorlevel 1 exit /b !errorlevel!
call "!SCRIPT_DIR!lib.bat" :require_wsl
if errorlevel 1 exit /b 1
call "!SCRIPT_DIR!lib.bat" :require_powershell
if errorlevel 1 exit /b 1
call "!SCRIPT_DIR!lib.bat" :ensure_output_dir
if errorlevel 1 exit /b 1

if not exist "!CARGO_TOML!" (
    echo [ERROR] Cargo.toml not found: !CARGO_TOML!
    exit /b 1
)

set "BUNDLE_DIR=%TEMP%\opi_special_openssl_!LIB_NAME!_%RANDOM%"
set "ZIP_PATH=!OPI_SPECIAL_OUTPUT!\!LIB_NAME!_static-openssl.zip"
set "HAS_X64=0"
set "HAS_X86=0"

if exist "!BUNDLE_DIR!" rmdir /S /Q "!BUNDLE_DIR!"
mkdir "!BUNDLE_DIR!" >nul 2>&1
if errorlevel 1 goto :error

pushd "!COMPONENT_PATH!"
if errorlevel 1 goto :error

if /I "!ARCH!"=="x64" call :build_x64
if /I "!ARCH!"=="x86" call :build_x86
if /I "!ARCH!"=="both" call :build_x64
if /I "!ARCH!"=="both" call :build_x86
if errorlevel 1 (
    popd
    goto :error
)
popd

set "PLATFORM=static-openssl"
call "!SCRIPT_DIR!lib.bat" :write_manifest
if errorlevel 1 goto :error
call "!SCRIPT_DIR!lib.bat" :pack_zip
if errorlevel 1 goto :error

rmdir /S /Q "!BUNDLE_DIR!" >nul 2>&1
exit /b 0

:usage
echo Usage: build-static-openssl.bat ^<component_dir^> ^<cargo_name^> ^<lib_name^> [both^|x64^|x86]
echo Supported components: tcp_client, mysql, postgres, ssh
exit /b 2

:error
popd 2>nul
if exist "!BUNDLE_DIR!" rmdir /S /Q "!BUNDLE_DIR!" >nul 2>&1
echo [ERROR] Static OpenSSL build failed for !LIB_NAME!.
exit /b 1

:build_x64
set "TARGET=x86_64-unknown-linux-gnu.2.17"
set "SO_SOURCE=target\x86_64-unknown-linux-gnu\release\lib!CARGO_NAME!.so"
echo Building !LIB_NAME! ^(!COMPONENT_DIR!^) for !TARGET! with vendored OpenSSL...
wsl -d OracleLinux_9_1 -- bash -lc "cargo zigbuild --locked --release --target !TARGET! --features vendored-openssl"
if errorlevel 1 exit /b 1
if not exist "!SO_SOURCE!" (
    echo [ERROR] Built .so not found: !SO_SOURCE!
    exit /b 1
)
copy /Y "!SO_SOURCE!" "!BUNDLE_DIR!\AddIn_!LIB_NAME!_x64_linux.so" >nul
if errorlevel 1 exit /b 1
set "HAS_X64=1"
exit /b 0

:build_x86
set "TARGET=i686-unknown-linux-gnu.2.17"
set "SO_SOURCE=target\i686-unknown-linux-gnu\release\lib!CARGO_NAME!.so"
echo Building !LIB_NAME! ^(!COMPONENT_DIR!^) for !TARGET! with vendored OpenSSL...
wsl -d OracleLinux_9_1 -- bash -lc "cargo zigbuild --locked --release --target !TARGET! --features vendored-openssl"
if errorlevel 1 exit /b 1
if not exist "!SO_SOURCE!" (
    echo [ERROR] Built .so not found: !SO_SOURCE!
    exit /b 1
)
copy /Y "!SO_SOURCE!" "!BUNDLE_DIR!\AddIn_!LIB_NAME!_x86_linux.so" >nul
if errorlevel 1 exit /b 1
set "HAS_X86=1"
exit /b 0
