@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\.."
set "ADDINS_DIR=%ROOT_DIR%\src\addins"
set "TEMP_NOTICE=%SCRIPT_DIR%temp_dependencies.txt"
set "NOTICE_FILE=%ROOT_DIR%\NOTICE"
set "LICENSE_FILE=%ROOT_DIR%\LICENSE-THIRD-PARTY"
set "TEMPLATE_FILE=%ROOT_DIR%\service\templates\notice.txt"
set "ABOUT_CONFIG=%SCRIPT_DIR%about.toml"
set "NOTICE_TEMPLATE=%SCRIPT_DIR%about.hbs"
set "LICENSE_TEMPLATE=%SCRIPT_DIR%licenses.hbs"
set "MERGED_JSON=%SCRIPT_DIR%temp_merged.json"

where cargo-about >nul 2>&1
if !ERRORLEVEL! NEQ 0 (
    echo cargo-about not found!
    echo Call: cargo install cargo-about
    exit /b 1
)

if not exist "%TEMPLATE_FILE%" (
    echo Template not found: %TEMPLATE_FILE%
    exit /b 1
)

if not exist "%NOTICE_TEMPLATE%" (
    echo Template not found: %NOTICE_TEMPLATE%
    exit /b 1
)

if not exist "%LICENSE_TEMPLATE%" (
    echo Template not found: %LICENSE_TEMPLATE%
    exit /b 1
)

if exist "%TEMP_NOTICE%" del "%TEMP_NOTICE%"
if exist "%MERGED_JSON%" del "%MERGED_JSON%"
echo. > "%TEMP_NOTICE%"

echo Collecting license data...
echo.

cd /d "%ADDINS_DIR%"

rem Collect NOTICE data (simple text format)
for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo Processing %%P for NOTICE...
        pushd "%%P"
        
        set "NOTICE_OUT=%TEMP_NOTICE%.%%P"
        cargo about generate --config "%ABOUT_CONFIG%" -o "!NOTICE_OUT!" "%NOTICE_TEMPLATE%" 2>nul
        if exist "!NOTICE_OUT!" (
            type "!NOTICE_OUT!" >> "%TEMP_NOTICE%"
            del "!NOTICE_OUT!"
        )
        
        popd
    )
)

for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo Processing [%%D\%%~nxP] for NOTICE...
                pushd "%%P"
                
                set "NOTICE_OUT=%TEMP_NOTICE%.%%~nxP"
                cargo about generate --config "%ABOUT_CONFIG%" -o "!NOTICE_OUT!" "%NOTICE_TEMPLATE%" 2>nul
                if exist "!NOTICE_OUT!" (
                    type "!NOTICE_OUT!" >> "%TEMP_NOTICE%"
                    del "!NOTICE_OUT!"
                )
                
                popd
            )
        )
    )
)

echo.
echo Processing NOTICE file...

powershell -Command "$content = Get-Content '%TEMP_NOTICE%' -Encoding UTF8 | Where-Object { $_.Trim() -ne '' }; $unique = $content | Select-Object -Unique | Sort-Object; $formatted = $unique | ForEach-Object { $parts = $_ -split '\|'; if ($parts.Count -eq 5) { \"Используется библиотека $($parts[0]) v$($parts[1])`n * $($parts[2])`n * Licensed under the $($parts[3])`n * $($parts[4])`n\" } }; $formatted | Out-File '%TEMP_NOTICE%.sorted' -Encoding UTF8"

(
type "%TEMPLATE_FILE%"
echo.
type "%TEMP_NOTICE%.sorted"
) > "%NOTICE_FILE%"

echo Collecting license texts from all projects...

rem Collect all JSON data and merge
set "FIRST=1"
echo { "all_licenses": [ > "%MERGED_JSON%"

for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo Processing %%P for licenses...
        pushd "%%P"
        
        set "JSON_OUT=%MERGED_JSON%.%%P"
        cargo about generate --config "%ABOUT_CONFIG%" --format json -o "!JSON_OUT!" 2>nul
        if exist "!JSON_OUT!" (
            if "!FIRST!"=="0" echo , >> "%MERGED_JSON%"
            type "!JSON_OUT!" >> "%MERGED_JSON%"
            del "!JSON_OUT!"
            set "FIRST=0"
        )
        
        popd
    )
)

for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo Processing [%%D\%%~nxP] for licenses...
                pushd "%%P"
                
                set "JSON_OUT=%MERGED_JSON%.%%~nxP"
                cargo about generate --config "%ABOUT_CONFIG%" --format json -o "!JSON_OUT!" 2>nul
                if exist "!JSON_OUT!" (
                    if "!FIRST!"=="0" echo , >> "%MERGED_JSON%"
                    type "!JSON_OUT!" >> "%MERGED_JSON%"
                    del "!JSON_OUT!"
                    set "FIRST=0"
                )
                
                popd
            )
        )
    )
)

echo ] } >> "%MERGED_JSON%"

echo.
echo Processing LICENSE-THIRD-PARTY file...

rem Use PowerShell to merge and deduplicate licenses from JSON
powershell -File "%SCRIPT_DIR%merge_licenses.ps1" "%MERGED_JSON%" "%LICENSE_FILE%"

del "%TEMP_NOTICE%" 2>nul
del "%TEMP_NOTICE%.sorted" 2>nul
del "%MERGED_JSON%" 2>nul

echo.
echo Success!
echo Created: NOTICE
echo Created: LICENSE-THIRD-PARTY

exit /b 0
