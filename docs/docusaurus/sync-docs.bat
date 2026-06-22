@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "SOURCE_DIR=%SCRIPT_DIR%..\ru\md"
set "TARGET_DIR=%SCRIPT_DIR%docs"

if not exist "%SOURCE_DIR%\" (
  echo [ERROR] Source not found: "%SOURCE_DIR%"
  exit /b 1
)

if not exist "%TARGET_DIR%\" mkdir "%TARGET_DIR%"

echo Syncing docs from "%SOURCE_DIR%" to "%TARGET_DIR%"

robocopy "%SOURCE_DIR%" "%TARGET_DIR%" /MIR /NFL /NDL /NJH /NJS /NP
if %ERRORLEVEL% GEQ 8 (
  echo [ERROR] Failed to sync docs directory.
  exit /b %ERRORLEVEL%
)

echo Docs sync completed.
exit /b 0
