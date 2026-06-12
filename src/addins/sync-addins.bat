@echo off
cd /d "%~dp0..\.."

git rev-parse --abbrev-ref HEAD | findstr /i /x "addins" >nul && (
    echo Already on addins branch.
    exit /b 0
)

git fetch origin addins --depth=1
if errorlevel 1 exit /b 1

:: Only paths published to origin/addins (see publish-addins.bat).
:: Worktree only: binaries are in .gitignore and must not be staged.
git restore --source=origin/addins --worktree -- src/ru/OInt/addins/ src/en/OInt/addins/
if errorlevel 1 exit /b 1

for /f "delims=" %%F in ('git ls-tree -r --name-only origin/addins -- src/ru/BSL/OpenIntegrations/src/CommonTemplates src/en/BSL/OpenIntegrations/src/CommonTemplates') do (
    git restore --source=origin/addins --worktree -- "%%F"
    if errorlevel 1 exit /b 1
)

echo Add-ins synced from origin/addins.
exit /b 0
