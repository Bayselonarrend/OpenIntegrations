@echo off
setlocal

:: Builds one addin for Windows 7 / Server 2008 R2 and packs zip bundle.
:: Usage:
::   build-win7-package.bat <component_dir> <cargo_name> <lib_name> [x64|x86|both]
::
:: Example for SSH:
::   build-win7-package.bat ssh opi_ssh OPI_SSH

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
set "DLL_BUNDLE_X64=AddIn_%LIB_NAME%_x64_windows.dll"
set "DLL_BUNDLE_X86=AddIn_%LIB_NAME%_x86_windows.dll"
set "ZIP_PATH=%ARTIFACT_DIR%\%LIB_NAME%_win7_%ARCH%.zip"

if not exist "%CARGO_TOML%" (
    echo [ERROR] Cargo.toml not found: %CARGO_TOML%
    exit /b 1
)

where cargo >nul 2>&1
if errorlevel 1 (
    echo [ERROR] cargo not found in PATH.
    exit /b 1
)

where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)

if exist "%BUNDLE_DIR%" rmdir /S /Q "%BUNDLE_DIR%"
mkdir "%BUNDLE_DIR%" >nul 2>&1
if errorlevel 1 goto :error

set "HAS_X64=0"
set "HAS_X86=0"

if /I "%ARCH%"=="x64" call :build_x64
if /I "%ARCH%"=="x86" call :build_x86
if /I "%ARCH%"=="both" call :build_x64
if /I "%ARCH%"=="both" call :build_x86
if errorlevel 1 goto :error

(
echo ^<?xml version='1.0' encoding='UTF-8'?^>
echo ^<bundle xmlns='http://v8.1c.ru/8.2/addin/bundle' name='%LIB_NAME%'^>
if "%HAS_X86%"=="1" echo   ^<component os='Windows' path='%DLL_BUNDLE_X86%' type='native' arch='i386' /^>
if "%HAS_X64%"=="1" echo   ^<component os='Windows' path='%DLL_BUNDLE_X64%' type='native' arch='x86_64' /^>
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
echo Install this zip as external component package.
exit /b 0

:usage
echo Usage: build-win7-package.bat ^<component_dir^> ^<cargo_name^> ^<lib_name^> [x64^|x86^|both]
echo Example x64 : build-win7-package.bat ssh opi_ssh OPI_SSH x64
echo Example x86 : build-win7-package.bat ssh opi_ssh OPI_SSH x86
echo Example both: build-win7-package.bat ssh opi_ssh OPI_SSH both
exit /b 2

:error
echo [ERROR] Build or packaging failed.
exit /b 1

:build_x64
set "TARGET=x86_64-win7-windows-msvc"
set "DLL_SOURCE=%COMPONENT_PATH%\target\%TARGET%\release\%CARGO_NAME%.dll"
echo Building %LIB_NAME% from %COMPONENT_DIR% for %TARGET%...
cargo +nightly build --manifest-path "%CARGO_TOML%" --release --target %TARGET% "-Zbuild-std=std,panic_unwind"
if errorlevel 1 exit /b 1
if not exist "%DLL_SOURCE%" (
    echo [ERROR] Built DLL not found: %DLL_SOURCE%
    exit /b 1
)
copy /Y "%DLL_SOURCE%" "%BUNDLE_DIR%\%DLL_BUNDLE_X64%" >nul
if errorlevel 1 exit /b 1
set "HAS_X64=1"
exit /b 0

:build_x86
set "TARGET=i686-win7-windows-msvc"
set "DLL_SOURCE=%COMPONENT_PATH%\target\%TARGET%\release\%CARGO_NAME%.dll"
echo Building %LIB_NAME% from %COMPONENT_DIR% for %TARGET%...
cargo +nightly build --manifest-path "%CARGO_TOML%" --release --target %TARGET% "-Zbuild-std=std,panic_unwind"
if errorlevel 1 exit /b 1
if not exist "%DLL_SOURCE%" (
    echo [ERROR] Built DLL not found: %DLL_SOURCE%
    exit /b 1
)
copy /Y "%DLL_SOURCE%" "%BUNDLE_DIR%\%DLL_BUNDLE_X86%" >nul
if errorlevel 1 exit /b 1
set "HAS_X86=1"
exit /b 0
