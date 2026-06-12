@echo off
cd /d "%~dp0..\.."

git rev-parse --abbrev-ref HEAD | findstr /i /x "addins" >nul && (
    echo Checkout main first.
    exit /b 1
)

if not exist "src\ru\OInt\addins\*.zip" (
    echo No zip files in src\ru\OInt\addins
    exit /b 1
)

git checkout --orphan addins
git reset

git add src/ru/OInt/addins/*.zip
git add src/en/OInt/addins/*.zip
git add src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin
git add src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin

git commit -m "addins: publish"
if errorlevel 1 goto :fail

git push --force origin addins
if errorlevel 1 goto :fail

git clean -fd
git checkout main

echo Published to origin/addins.
exit /b 0

:fail
git clean -fd 2>nul
git checkout main 2>nul
exit /b 1
