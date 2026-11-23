@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%R in ('git rev-parse --show-toplevel') do cd /d "%%R"

set "ADDINS_REF=%~1"
if "!ADDINS_REF!"=="" set "ADDINS_REF=%ADDINS_BRANCH%"
if "!ADDINS_REF!"=="" set "ADDINS_REF=addins"

set "OK="
if /i "!ADDINS_REF!"=="addins" set "OK=1"
echo !ADDINS_REF!| findstr /r /i "^addins-alpaca-[0-9][0-9]*$" >nul && set "OK=1"
if not defined OK (
    echo Invalid add-ins branch: !ADDINS_REF!
    exit /b 1
)

for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "HEAD_BRANCH=%%B"
if /i "!HEAD_BRANCH!"=="!ADDINS_REF!" (
    echo Already on !ADDINS_REF!.
    exit /b 0
)

git fetch origin !ADDINS_REF! --depth=1
if not errorlevel 1 goto :fetched
if /i "!ADDINS_REF!"=="addins" exit /b 1
echo !ADDINS_REF! is not on origin yet. Syncing addins.
set "ADDINS_REF=addins"
git fetch origin addins --depth=1
if errorlevel 1 exit /b 1

:fetched
git restore --source=origin/!ADDINS_REF! --worktree -- src/ru/OInt/addins/ src/en/OInt/addins/
if errorlevel 1 exit /b 1

for /f "delims=" %%F in ('git ls-tree -r --name-only origin/!ADDINS_REF! -- src/ru/BSL/OpenIntegrations/src/CommonTemplates src/en/BSL/OpenIntegrations/src/CommonTemplates') do (
    git restore --source=origin/!ADDINS_REF! --worktree -- "%%F"
    if errorlevel 1 exit /b 1
)

echo Add-ins synced from origin/!ADDINS_REF!.
exit /b 0
