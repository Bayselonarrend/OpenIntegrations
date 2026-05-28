@echo off
setlocal

set "CARGO_NAME=lua"
set "ADDIN_DIR=%~dp0"

set "LIB_NAME=OPI_Lua54"
set "CARGO_EXTRA="
set "WSL_EXTRA_ENV="
call ../build.bat
if errorlevel 1 exit /b 1

set "LIB_NAME=OPI_LuaJIT"
set "CARGO_EXTRA=--no-default-features --features luajit"
set "WSL_EXTRA_ENV=TARGET_LDFLAGS=-lunwind"
call ../build.bat
if errorlevel 1 exit /b 1

exit /b 0
