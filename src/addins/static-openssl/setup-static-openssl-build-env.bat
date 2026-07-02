@echo off
setlocal

:: One-time setup for building addins with statically linked OpenSSL 3.x (Linux).
:: Run this script once on the build machine (Windows 10/11 + WSL recommended).

where wsl >nul 2>&1
if errorlevel 1 (
    echo [ERROR] wsl not found in PATH. Install WSL and Oracle Linux 9.1 distro.
    exit /b 1
)

where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)

echo [1/3] Checking WSL distro OracleLinux_9_1...
wsl -d OracleLinux_9_1 -- echo WSL OK >nul 2>&1
if errorlevel 1 (
    echo [ERROR] WSL distro OracleLinux_9_1 is not available.
    echo        Install Oracle Linux 9.1 for WSL or adjust the distro name in build scripts.
    exit /b 1
)

echo [2/3] Checking cargo-zigbuild in WSL...
wsl -d OracleLinux_9_1 -- bash -lc "command -v cargo-zigbuild" >nul 2>&1
if errorlevel 1 (
    echo [WARN] cargo-zigbuild not found in WSL.
    echo        Install: cargo install cargo-zigbuild
) else (
    echo [OK] cargo-zigbuild found.
)

echo [3/3] Checking build tools for vendored OpenSSL...
wsl -d OracleLinux_9_1 -- bash -lc "command -v perl && command -v make && command -v cc" >nul 2>&1
if errorlevel 1 (
    echo [WARN] perl/make/cc not found in WSL.
    echo        Install build tools in Oracle Linux, e.g.:
    echo        sudo dnf install -y perl make gcc
) else (
    echo [OK] perl, make and cc found.
)

echo.
echo Setup completed.
echo Next step: run build-static-openssl-package.bat from this directory.
exit /b 0
