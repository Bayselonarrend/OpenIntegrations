@echo off
setlocal EnableDelayedExpansion

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "ADDINS_DIR=%%~fI"
set "OPI_SPECIAL_OUTPUT=%SCRIPT_DIR%output"
set "ARCH=both"

if not exist "%OPI_SPECIAL_OUTPUT%" mkdir "%OPI_SPECIAL_OUTPUT%"

echo ========================================
echo Special add-ins: win7 (all components)
echo Output: %OPI_SPECIAL_OUTPUT%
echo ========================================

for /d %%D in ("%ADDINS_DIR%\*") do (
    set "DIR_NAME=%%~nxD"
    if /I not "!DIR_NAME!"=="commons" if /I not "!DIR_NAME!"=="special" if /I not "!DIR_NAME!"=="legacy-win7" if /I not "!DIR_NAME!"=="static-openssl" (
        if exist "%%D\release.bat" (
            call :read_release_names "%%D"
            if errorlevel 1 goto :fail

            echo.
            echo --- Win7: !LIB_NAME! ^(!DIR_NAME!^) ---
            call "%SCRIPT_DIR%build-win7.bat" "!DIR_NAME!" "!CARGO_NAME!" "!LIB_NAME!" "%ARCH%"
            if errorlevel 1 goto :fail

            if /I "!DIR_NAME!"=="lua" (
                echo.
                echo --- Win7: OPI_LuaJIT ^(lua^) ---
                call "%SCRIPT_DIR%build-win7.bat" lua lua OPI_LuaJIT "%ARCH%" --no-default-features --features luajit
                if errorlevel 1 goto :fail
            )
        )
    )
)

echo.
echo ========================================
echo Special add-ins: static-openssl (TLS)
echo ========================================

call :build_static_openssl tcp_client opi_tcpclient OPI_TCPClient
if errorlevel 1 goto :fail
call :build_static_openssl mysql opi_mysql OPI_MySQL
if errorlevel 1 goto :fail
call :build_static_openssl postgres opi_postgres OPI_PostgreSQL
if errorlevel 1 goto :fail
call :build_static_openssl ssh opi_ssh OPI_SSH
if errorlevel 1 goto :fail

echo.
echo ========================================
echo All special builds completed.
echo Archives: %OPI_SPECIAL_OUTPUT%\*_win7.zip, *_static-openssl.zip
echo ========================================
exit /b 0

:build_static_openssl
echo.
echo --- Static OpenSSL: %~3 ^(%~1^) ---
call "%SCRIPT_DIR%build-static-openssl.bat" %1 %2 %3 "%ARCH%"
exit /b %errorlevel%

:read_release_names
set "RELEASE_BAT=%~1\release.bat"
set "CARGO_NAME="
set "LIB_NAME="
for /f "usebackq tokens=1,* delims==" %%A in (`findstr /b /r "set CARGO_NAME=" "%RELEASE_BAT%"`) do set "CARGO_NAME=%%B"
for /f "usebackq tokens=1,* delims==" %%A in (`findstr /b /r "set LIB_NAME=" "%RELEASE_BAT%"`) do (
    set "LIB_NAME=%%B"
    goto :read_release_names_done
)
:read_release_names_done
if not defined CARGO_NAME (
    echo [ERROR] CARGO_NAME not found in %RELEASE_BAT%
    exit /b 1
)
if not defined LIB_NAME (
    echo [ERROR] LIB_NAME not found in %RELEASE_BAT%
    exit /b 1
)
exit /b 0

:fail
echo.
echo ERROR: Special build failed.
exit /b 1
