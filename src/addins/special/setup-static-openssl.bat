@echo off
setlocal

:: One-time setup for static OpenSSL special builds (Linux via WSL).

where wsl >nul 2>&1
if errorlevel 1 (
    echo [ERROR] wsl not found in PATH. Install WSL and Oracle Linux 9.1 distro.
    exit /b 1
)

echo [1/3] Checking WSL distro OracleLinux_9_1...
wsl -d OracleLinux_9_1 -- echo WSL OK >nul 2>&1
if errorlevel 1 (
    echo [ERROR] WSL distro OracleLinux_9_1 is not available.
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
    echo        Install: sudo dnf install -y perl make gcc
) else (
    echo [OK] perl, make and cc found.
)

echo.
echo Setup completed. Next: build-static-openssl.bat or build_all.bat
exit /b 0
