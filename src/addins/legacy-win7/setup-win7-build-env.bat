@echo off
setlocal

:: One-time setup for building addins compatible with Windows 7 / Server 2008 R2.
:: Run this script once on the build machine (Windows 10/11 recommended).

where rustup >nul 2>&1
if errorlevel 1 (
    echo [ERROR] rustup not found in PATH. Install Rust from https://rustup.rs/
    exit /b 1
)

where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found in PATH.
    exit /b 1
)

echo [1/3] Installing nightly toolchain...
rustup toolchain install nightly
if errorlevel 1 goto :error

echo [2/3] Installing rust-src for nightly...
rustup component add rust-src --toolchain nightly-x86_64-pc-windows-msvc
if errorlevel 1 goto :error

echo [3/3] Checking MSVC compiler availability...
where cl >nul 2>&1
if errorlevel 1 (
    echo [WARN] cl.exe not found in PATH.
    echo        Install Visual Studio Build Tools with C++ workload.
) else (
    echo [OK] cl.exe found.
)

echo.
echo Setup completed.
echo Next step: run build-win7-package.bat from this directory.
exit /b 0

:error
echo [ERROR] Setup failed.
exit /b 1
