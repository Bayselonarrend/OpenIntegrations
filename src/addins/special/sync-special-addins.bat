@echo off
cd /d "%~dp0..\..\.."

set "SPECIAL_OUTPUT=src\addins\special\output"
set "BRANCH=addins-special"

git rev-parse --abbrev-ref HEAD | findstr /i /x "%BRANCH%" >nul && (
    echo Already on %BRANCH% branch.
    exit /b 0
)

git fetch origin %BRANCH% --depth=1
if errorlevel 1 exit /b 1

if not exist "%SPECIAL_OUTPUT%" mkdir "%SPECIAL_OUTPUT%"

git restore --source=origin/%BRANCH% --worktree -- %SPECIAL_OUTPUT%/
if errorlevel 1 exit /b 1

echo Special add-ins synced from origin/%BRANCH%.
exit /b 0
