@echo off

set THIS_DIR=%~dp0
set "THIS_DIR=%THIS_DIR:\=/%"

:: Перейти в директорию проекта
cd /d %ADDIN_DIR%

goto :next

:: Создать папку для артефактов
set OUTPUT_DIR=artifacts
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: СБОРКА ОСНОВНОЙ ВЕРСИИ ----------------------------------------------------------------------------------------------

cross clean
cargo clean

set CROSS_CONFIG=%THIS_DIR%CROSS_MAIN.toml

:: Сборка для x86_64-pc-windows-msvc
cargo build --release --target x86_64-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для x86_64-unknown-linux-gnu
cross build --release --target x86_64-unknown-linux-gnu
if errorlevel 1 goto :error

:: Сборка для i686-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc
if errorlevel 1 goto :error

:: Сборка для i686-unknown-linux-gnu
cross build --release --target i686-unknown-linux-gnu
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

copy /y ..\MANIFEST_MAIN.XML "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

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

@echo (MAIN) Build and packaging completed successfully.
goto :next

:error
@echo (MAIN) An error occurred during the build or packaging process.
exit /b 1

:next
:: СБОРКА ВЕРСИИ ДЛЯ СТАРЫХ СИСТЕМ -------------------------------------------------------------------------------------

cross clean
cargo clean

:: Создать папку для артефактов
set OUTPUT_DIR=artifacts_folv
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

set LIB_NAME=%LIB_NAME%_FOLV
set CROSS_CONFIG=%THIS_DIR%CROSS_FOLV.toml

:: Сборка для x86_64-unknown-linux-gnu
cross build --release --target x86_64-unknown-linux-gnu
if errorlevel 1 goto :error

:: Сборка для i686-unknown-linux-gnu
cross build --release --target i686-unknown-linux-gnu
if errorlevel 1 goto :error

copy /y target\x86_64-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\AddIn_x64_linux.so"
if errorlevel 1 goto :error

copy /y target\i686-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\AddIn_x86_linux.so"
if errorlevel 1 goto :error

copy /y ..\MANIFEST_FOLV.XML "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

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

@echo (FOLV) Build and packaging completed successfully.
exit /b 0

:error
@echo (FOLV) An error occurred during the build or packaging process.
exit /b 1