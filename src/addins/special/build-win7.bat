@echo off
setlocal EnableDelayedExpansion

:: Builds one addin for Windows 7 / Server 2008 R2.
:: Usage: build-win7.bat <component_dir> <cargo_name> <lib_name> [both|x64|x86] [cargo_extra...]

if "%~3"=="" goto :usage

set "COMPONENT_DIR=%~1"
set "CARGO_NAME=%~2"
set "LIB_NAME=%~3"
set "ARCH=%~4"
if "!ARCH!"=="" set "ARCH=both"
set "CARGO_EXTRA=%~5 %~6 %~7 %~8 %~9"

set "SCRIPT_DIR=%~dp0"
for %%I in ("!SCRIPT_DIR!..") do set "ADDINS_DIR=%%~fI"
set "COMPONENT_PATH=!ADDINS_DIR!\!COMPONENT_DIR!"
set "CARGO_TOML=!COMPONENT_PATH!\Cargo.toml"

call "!SCRIPT_DIR!lib.bat" :validate_arch "!ARCH!"
if errorlevel 1 exit /b !errorlevel!
call "!SCRIPT_DIR!lib.bat" :require_cargo
if errorlevel 1 exit /b 1
call "!SCRIPT_DIR!lib.bat" :require_powershell
if errorlevel 1 exit /b 1
call "!SCRIPT_DIR!lib.bat" :ensure_output_dir
if errorlevel 1 exit /b 1

if not exist "!CARGO_TOML!" (
    echo [ERROR] Cargo.toml not found: !CARGO_TOML!
    exit /b 1
)

set "BUNDLE_DIR=%TEMP%\opi_special_win7_!LIB_NAME!_%RANDOM%"
set "ZIP_PATH=!OPI_SPECIAL_OUTPUT!\!LIB_NAME!_win7.zip"
set "HAS_X64=0"
set "HAS_X86=0"

if exist "!BUNDLE_DIR!" rmdir /S /Q "!BUNDLE_DIR!"
mkdir "!BUNDLE_DIR!" >nul 2>&1
if errorlevel 1 goto :error

if /I "!ARCH!"=="x64" call :build_x64
if /I "!ARCH!"=="x86" call :build_x86
if /I "!ARCH!"=="both" call :build_x64
if /I "!ARCH!"=="both" call :build_x86
if errorlevel 1 goto :error

set "PLATFORM=win7"
call "!SCRIPT_DIR!lib.bat" :write_manifest
if errorlevel 1 goto :error
call "!SCRIPT_DIR!lib.bat" :pack_zip
if errorlevel 1 goto :error

rmdir /S /Q "!BUNDLE_DIR!" >nul 2>&1
exit /b 0

:usage
echo Usage: build-win7.bat ^<component_dir^> ^<cargo_name^> ^<lib_name^> [both^|x64^|x86] [cargo_extra...]
exit /b 2

:error
if exist "!BUNDLE_DIR!" rmdir /S /Q "!BUNDLE_DIR!" >nul 2>&1
echo [ERROR] Win7 build failed for !LIB_NAME!.
exit /b 1

:build_x64
set "TARGET=x86_64-win7-windows-msvc"
set "DLL_SOURCE=!COMPONENT_PATH!\target\!TARGET!\release\!CARGO_NAME!.dll"
echo Building !LIB_NAME! ^(!COMPONENT_DIR!^) for !TARGET!...
cargo +nightly build --locked --manifest-path "!CARGO_TOML!" --release --target !TARGET! "-Zbuild-std=std,panic_unwind" !CARGO_EXTRA!
if errorlevel 1 exit /b 1
if not exist "!DLL_SOURCE!" (
    echo [ERROR] Built DLL not found: !DLL_SOURCE!
    exit /b 1
)
copy /Y "!DLL_SOURCE!" "!BUNDLE_DIR!\AddIn_!LIB_NAME!_x64_windows.dll" >nul
if errorlevel 1 exit /b 1
set "HAS_X64=1"
exit /b 0

:build_x86
set "TARGET=i686-win7-windows-msvc"
set "DLL_SOURCE=!COMPONENT_PATH!\target\!TARGET!\release\!CARGO_NAME!.dll"
echo Building !LIB_NAME! ^(!COMPONENT_DIR!^) for !TARGET!...
cargo +nightly build --locked --manifest-path "!CARGO_TOML!" --release --target !TARGET! "-Zbuild-std=std,panic_unwind" !CARGO_EXTRA!
if errorlevel 1 exit /b 1
if not exist "!DLL_SOURCE!" (
    echo [ERROR] Built DLL not found: !DLL_SOURCE!
    exit /b 1
)
copy /Y "!DLL_SOURCE!" "!BUNDLE_DIR!\AddIn_!LIB_NAME!_x86_windows.dll" >nul
if errorlevel 1 exit /b 1
set "HAS_X86=1"
exit /b 0
