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

:: Имена бинарей и манифеста зависят от LIB_NAME (см. release.bat проекта)
set "DLL_WIN64=AddIn_%LIB_NAME%_x64_windows.dll"
set "DLL_WIN86=AddIn_%LIB_NAME%_x86_windows.dll"
set "SO_LIN64=AddIn_%LIB_NAME%_x64_linux.so"
set "SO_LIN86=AddIn_%LIB_NAME%_x86_linux.so"

:: Копирование файлов .dll и .so
copy /y target\x86_64-pc-windows-msvc\release\%CARGO_NAME%.dll "%OUTPUT_DIR%\%DLL_WIN64%"
if errorlevel 1 goto :error

copy /y target\i686-pc-windows-msvc\release\%CARGO_NAME%.dll "%OUTPUT_DIR%\%DLL_WIN86%"
if errorlevel 1 goto :error

copy /y target\x86_64-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\%SO_LIN64%"
if errorlevel 1 goto :error

copy /y target\i686-unknown-linux-gnu\release\lib%CARGO_NAME%.so "%OUTPUT_DIR%\%SO_LIN86%"
if errorlevel 1 goto :error

(
echo ^<?xml version='1.0' encoding='UTF-8'?^>
echo ^<bundle xmlns='http://v8.1c.ru/8.2/addin/bundle' name='%LIB_NAME%'^>
echo 	^<component os='Windows' path='%DLL_WIN86%' type='native' arch='i386' /^>
echo 	^<component os='Windows' path='%DLL_WIN64%' type='native' arch='x86_64' /^>
echo 	^<component os='Linux' path='%SO_LIN86%' type='native' arch='i386' /^>
echo 	^<component os='Linux' path='%SO_LIN64%' type='native' arch='x86_64' /^>
echo ^</bundle^>
) > "%OUTPUT_DIR%\MANIFEST.XML"
if errorlevel 1 goto :error

echo "MAIN ---" > dependencies.log
wsl -d OracleLinux_8_7 ldd %OUTPUT_DIR%/%SO_LIN64% >> dependencies.log
wsl -d OracleLinux_8_7 bash -c "strings %OUTPUT_DIR%/%SO_LIN64% | grep GLIBC_" >> dependencies.log

:: Архивация
powershell -Command "Compress-Archive -Path '%OUTPUT_DIR%\*' -Force -DestinationPath '%LIB_NAME%.zip'"
if errorlevel 1 goto :error

copy /y "%LIB_NAME%.zip" "../../ru/OInt/addins/%LIB_NAME%.zip"
copy /y "%LIB_NAME%.zip" "../../en/OInt/addins/%LIB_NAME%.zip"

copy /y "%LIB_NAME%.zip" "../../ru/BSL/OpenIntegrations/src/CommonTemplates/%LIB_NAME%/Template.addin"
copy /y "%LIB_NAME%.zip" "../../en/BSL/OpenIntegrations/src/CommonTemplates/%LIB_NAME%/Template.addin"

if exist "%OUTPUT_DIR%" (
    rmdir /S /Q "%OUTPUT_DIR%"
)

del "%LIB_NAME%.zip"

@echo (MAIN) Build and packaging completed successfully.
exit /b 0

:error
@echo (MAIN) An error occurred during the build or packaging process.
exit /b 1
