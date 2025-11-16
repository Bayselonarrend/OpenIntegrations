@echo off

set THIS_DIR=%~dp0
set "THIS_DIR=%THIS_DIR:\=/%"
set VCPKG_ROOT=R:\Repos\vcpkg

:: Перейти в директорию проекта
cd /d %ADDIN_DIR%

:: Создать папку для артефактов
set OUTPUT_DIR=artifacts
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: СБОРКА ОСНОВНОЙ ВЕРСИИ ----------------------------------------------------------------------------------------------

:: Сборка для x86_64-pc-windows-msvc

set OPENSSL_DIR=R:\Repos\vcpkg\installed\x64-windows
set OPENSSL_LIB_DIR=R:\Repos\vcpkg\installed\x64-windows\lib
set OPENSSL_INCLUDE_DIR=R:\Repos\vcpkg\installed\x64-windows\include

cargo build --release --target x86_64-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для x86_64-unknown-linux-gnu
wsl -d OracleLinux_9_1 env LIBRARY_PATH=/usr/lib64 OPENSSL_DIR=/usr cargo zigbuild --release --target x86_64-unknown-linux-gnu.2.17
if errorlevel 1 goto :error

:: Сборка для i686-pc-windows-msvc

set OPENSSL_DIR=R:\Repos\vcpkg\installed\x86-windows
set OPENSSL_LIB_DIR=R:\Repos\vcpkg\installed\x86-windows\lib
set OPENSSL_INCLUDE_DIR=R:\Repos\vcpkg\installed\x86-windows\include

cargo build --release --target i686-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для i686-unknown-linux-gnu
wsl -d OracleLinux_9_1 env LIBRARY_PATH=/usr/lib OPENSSL_DIR=/usr OPENSSL_LIB_DIR=/usr/lib/ OPENSSL_INCLUDE_DIR=/usr/include cargo zigbuild --release --target i686-unknown-linux-gnu.2.17
if errorlevel 1 goto :error

:: Копирование файлов .dll и .so
copy /y target\x86_64-pc-windows-msvc\release\%CARGO_NAME%.dll "%OUTPUT_DIR%\AddIn_x64_windows.dll"
if errorlevel 1 goto :error

copy /y target\i686-pc-windows-msvc\release\%CARGO_NAME%.dll "%OUTPUT_DIR%\AddIn_x86_windows.dll"
if errorlevel 1 goto :error

copy /y target\x86_64-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\AddIn_x64_linux.so"
if errorlevel 1 goto :error

copy /y target\i686-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\AddIn_x86_linux.so"
if errorlevel 1 goto :error

copy /y ..\MANIFEST.XML "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

echo "MAIN ---" > dependencies.log
wsl -d OracleLinux_8_7 ldd %OUTPUT_DIR%/AddIn_x64_linux.so >> dependencies.log
wsl -d OracleLinux_8_7 bash -c "strings %OUTPUT_DIR%/AddIn_x64_linux.so | grep GLIBC_" >> dependencies.log

:: Архивация
powershell -Command "Compress-Archive -Path '%OUTPUT_DIR%\*' -Force -DestinationPath '%LIB_NAME%.zip'"
if errorlevel 1 goto :error

copy /y "%LIB_NAME%.zip" "../../ru/OInt/addins/%LIB_NAME%.zip"
copy /y "%LIB_NAME%.zip" "../../en/OInt/addins/%LIB_NAME%.zip"

copy /y "%LIB_NAME%.zip" "../../ru/OPI/src/CommonTemplates/%LIB_NAME%/Template.addin"
copy /y "%LIB_NAME%.zip" "../../en/OPI/src/CommonTemplates/%LIB_NAME%/Template.addin"

if exist "%OUTPUT_DIR%" (
    rmdir /S /Q "%OUTPUT_DIR%"
)

del "%LIB_NAME%.zip"

@echo (MAIN) Build and packaging completed successfully.
exit /b 0

:error
@echo (MAIN) An error occurred during the build or packaging process.
exit /b 1
