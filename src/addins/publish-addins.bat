@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0..\.."

git rev-parse --abbrev-ref HEAD | findstr /i /x "addins" >nul && (
    echo Checkout main first.
    exit /b 1
)

if not exist "src\ru\OInt\addins\*.zip" (
    echo No zip files in src\ru\OInt\addins
    exit /b 1
)

for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "SAVED_BRANCH=%%B"

git branch -D addins 2>nul
git checkout --orphan addins
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

git push --force origin addins
if errorlevel 1 goto :fail

git checkout -f "%SAVED_BRANCH%"
if errorlevel 1 goto :fail

git branch -D addins 2>nul

call "%~dp0sync-addins.bat"
if errorlevel 1 goto :fail

echo Published to origin/addins.
exit /b 0

:fail
git checkout -f "%SAVED_BRANCH%" 2>nul
git branch -D addins 2>nul
call "%~dp0sync-addins.bat" 2>nul
exit /b 1
