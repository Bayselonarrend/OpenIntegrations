@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%R in ('git rev-parse --show-toplevel') do cd /d "%%R"

set "ADDINS_REF=%~1"
if "!ADDINS_REF!"=="" set "ADDINS_REF=%ADDINS_BRANCH%"
if "!ADDINS_REF!"=="" set "ADDINS_REF=addins"

set "OK="
if /i "!ADDINS_REF!"=="addins" set "OK=1"
echo !ADDINS_REF!| findstr /r /i "^addins/alpaca/[0-9][0-9]*$" >nul && set "OK=1"
if not defined OK (
    echo Invalid add-ins branch: !ADDINS_REF!
    exit /b 1
)

for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "SAVED_BRANCH=%%B"
if /i "!SAVED_BRANCH!"=="!ADDINS_REF!" (
    echo Checkout a work branch first.
    exit /b 1
)

if not exist "src\ru\OInt\addins\*.zip" (
    echo No zip files in src\ru\OInt\addins
    exit /b 1
)

git branch -D addins-publish-tmp 2>nul
git checkout --orphan addins-publish-tmp
if errorlevel 1 goto :fail

git reset
if errorlevel 1 goto :fail

git add -f src/ru/OInt/addins/*.zip
git add -f src/en/OInt/addins/*.zip
if errorlevel 1 goto :fail

for /d %%D in (src\ru\BSL\OpenIntegrations\src\CommonTemplates\*) do (
    if exist "%%D\Template.addin" git add -f "%%D/Template.addin"
)
for /d %%D in (src\en\BSL\OpenIntegrations\src\CommonTemplates\*) do (
    if exist "%%D\Template.addin" git add -f "%%D/Template.addin"
)

git commit -m "addins: publish"
if errorlevel 1 goto :fail

git push --force origin "HEAD:refs/heads/!ADDINS_REF!"
if errorlevel 1 goto :fail

git checkout -f "!SAVED_BRANCH!"
if errorlevel 1 goto :fail

git branch -D addins-publish-tmp 2>nul

call "%~dp0sync-addins.bat" "!ADDINS_REF!"
if errorlevel 1 goto :fail

echo Published to origin/!ADDINS_REF!.
exit /b 0

:fail
git checkout -f "!SAVED_BRANCH!" 2>nul
git branch -D addins-publish-tmp 2>nul
call "%~dp0sync-addins.bat" "!ADDINS_REF!" 2>nul
exit /b 1
