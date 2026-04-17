@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "PRIMARY_SOURCE=%SCRIPT_DIR%..\..\..\OpenIntegrations-Courses"
set "FALLBACK_SOURCE=%SCRIPT_DIR%..\..\OpenIntegrations-Courses"
set "SOURCE_DIR="

if exist "%PRIMARY_SOURCE%\" (
  set "SOURCE_DIR=%PRIMARY_SOURCE%"
) else (
  if exist "%FALLBACK_SOURCE%\" (
    set "SOURCE_DIR=%FALLBACK_SOURCE%"
  )
)

if not exist "%SOURCE_DIR%\" (
  echo [ERROR] Source repo not found.
  echo Tried:
  echo   "%PRIMARY_SOURCE%"
  echo   "%FALLBACK_SOURCE%"
  echo Clone OpenIntegrations-Courses into repository root and retry.
  exit /b 1
)

echo Syncing course content from "%SOURCE_DIR%"

if not exist "%SCRIPT_DIR%courses" mkdir "%SCRIPT_DIR%courses"
if not exist "%SCRIPT_DIR%data" mkdir "%SCRIPT_DIR%data"
if not exist "%SCRIPT_DIR%src\pages" mkdir "%SCRIPT_DIR%src\pages"
if not exist "%SCRIPT_DIR%static\img\Courses" mkdir "%SCRIPT_DIR%static\img\Courses"

robocopy "%SOURCE_DIR%\courses" "%SCRIPT_DIR%courses" /MIR /NFL /NDL /NJH /NJS /NP
if %ERRORLEVEL% GEQ 8 (
  echo [ERROR] Failed to sync courses directory.
  exit /b %ERRORLEVEL%
)

robocopy "%SOURCE_DIR%\data" "%SCRIPT_DIR%data" courses.json /NFL /NDL /NJH /NJS /NP
if %ERRORLEVEL% GEQ 8 (
  echo [ERROR] Failed to sync courses data file.
  exit /b %ERRORLEVEL%
)

robocopy "%SOURCE_DIR%\src\pages" "%SCRIPT_DIR%src\pages" courses.js courses.module.css /NFL /NDL /NJH /NJS /NP
if %ERRORLEVEL% GEQ 8 (
  echo [ERROR] Failed to sync courses page files.
  exit /b %ERRORLEVEL%
)

robocopy "%SOURCE_DIR%\static\img\Courses" "%SCRIPT_DIR%static\img\Courses" /MIR /NFL /NDL /NJH /NJS /NP
if %ERRORLEVEL% GEQ 8 (
  echo [ERROR] Failed to sync course images.
  exit /b %ERRORLEVEL%
)

echo Courses sync completed.
exit /b 0
