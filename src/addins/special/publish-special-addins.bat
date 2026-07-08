@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0..\..\.."

set "SPECIAL_OUTPUT=src\addins\special\output"
set "BRANCH=addins-special"

git rev-parse --abbrev-ref HEAD | findstr /i /x "%BRANCH%" >nul && (
    echo Checkout main first.
    exit /b 1
)

if not exist "%SPECIAL_OUTPUT%\*.zip" (
    echo No zip files in %SPECIAL_OUTPUT%
    exit /b 1
)

for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "SAVED_BRANCH=%%B"

git branch -D %BRANCH% 2>nul
git checkout --orphan %BRANCH%
if errorlevel 1 goto :fail

git reset
if errorlevel 1 goto :fail

git add -f %SPECIAL_OUTPUT%/*.zip
if errorlevel 1 goto :fail

git commit -m "addins-special: publish"
if errorlevel 1 goto :fail

git push --force origin %BRANCH%
if errorlevel 1 goto :fail

git checkout -f "!SAVED_BRANCH!"
if errorlevel 1 goto :fail

git branch -D %BRANCH% 2>nul

call "%~dp0sync-special-addins.bat"
if errorlevel 1 goto :fail

echo Published to origin/%BRANCH%.
exit /b 0

:fail
git checkout -f "!SAVED_BRANCH!" 2>nul
git branch -D %BRANCH% 2>nul
call "%~dp0sync-special-addins.bat" 2>nul
exit /b 1
