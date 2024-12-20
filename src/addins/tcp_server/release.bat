@echo off

:: Установить переменную
set LIB_NAME=opi_addin
set OPENSSL_DIR=C:\msys64\mingw64
set OPENSSL_LIB_DIR=%OPENSSL_DIR%\lib
set OPENSSL_INCLUDE_DIR=%OPENSSL_DIR%\include


:: Перейти в директорию проекта
cd /d "%~dp0"

:: Создать папку для артефактов
set OUTPUT_DIR=artifacts
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Сборка для x86_64-pc-windows-msvc
cargo build --release --target x86_64-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для x86_64-unknown-linux-gnu
cargo zigbuild --release --target x86_64-unknown-linux-gnu
if errorlevel 1 goto :error

:: Сборка для i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для i686-unknown-linux-gnu
cargo zigbuild --release --target i686-unknown-linux-gnu
if errorlevel 1 goto :error

:: Копирование файлов .dll и .so
copy /y target\x86_64-pc-windows-msvc\release\%LIB_NAME%.dll "%OUTPUT_DIR%\AddIn_x64_windows.dll"
if errorlevel 1 goto :error

copy /y target\i686-pc-windows-msvc\release\%LIB_NAME%.dll "%OUTPUT_DIR%\AddIn_x86_windows.dll"
if errorlevel 1 goto :error

copy /y target\x86_64-unknown-linux-gnu\release\lib%LIB_NAME%.so "%OUTPUT_DIR%\AddIn_x64_linux.so"
if errorlevel 1 goto :error

copy /y target\i686-unknown-linux-gnu\release\lib%LIB_NAME%.so "%OUTPUT_DIR%\AddIn_x86_linux.so"
if errorlevel 1 goto :error

copy /y MANIFEST.XML "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

:: Архивация
set ZIP_NAME=addin.zip
powershell -Command "Compress-Archive -Path '%OUTPUT_DIR%\*' -Force -DestinationPath '%ZIP_NAME%'"
if errorlevel 1 goto :error

if exist "%OUTPUT_DIR%" (
    rmdir /S /Q "%OUTPUT_DIR%"
)

@echo Build and packaging completed successfully.
exit /b 0

:error
@echo An error occurred during the build or packaging process.
exit /b 1
