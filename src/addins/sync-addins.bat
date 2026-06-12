@echo off
cd /d "%~dp0..\.."

git rev-parse --abbrev-ref HEAD | findstr /i /x "addins" >nul && (
    echo Already on addins branch.
    exit /b 0
)

git fetch origin addins --depth=1
if errorlevel 1 exit /b 1

git restore --source=origin/addins --worktree -- .
if errorlevel 1 exit /b 1

echo Add-ins synced from origin/addins.
exit /b 0
