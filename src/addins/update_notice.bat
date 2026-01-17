@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "TEMP_FILE=%CD%\temp_dependencies.txt"
set "NOTICE_FILE=..\..\NOTICE"
set "TEMPLATE_FILE=..\..\service\templates\notice.txt"
set "ABOUT_CONFIG=%CD%\about.toml"
set "ABOUT_TEMPLATE=%CD%\about.hbs"

where cargo-about >nul 2>&1
if !ERRORLEVEL! NEQ 0 (
    echo cargo-about now found!
    echo Call cargo install cargo-about
    exit /b 1
)

if not exist "%TEMPLATE_FILE%" (
    echo Template not found: %TEMPLATE_FILE%
    exit /b 1
)

if exist "%TEMP_FILE%" del "%TEMP_FILE%"
echo. > "%TEMP_FILE%"

echo Collecting data...
echo.

for /d %%P in (*) do (
    if exist "%%P\Cargo.toml" (
        echo Processing for %%P...
        pushd "%%P"
        set "PROJECT_OUT=%TEMP_FILE%.%%P"
        cargo about generate --config "%ABOUT_CONFIG%" -o "!PROJECT_OUT!" "%ABOUT_TEMPLATE%" 2>nul
        if exist "!PROJECT_OUT!" (
            type "!PROJECT_OUT!" >> "%TEMP_FILE%"
            del "!PROJECT_OUT!"
        )
        popd
    )
)

for /d %%D in (*) do (
    if exist "%%D\" (
        for /d %%P in ("%%D\*") do (
            if exist "%%P\Cargo.toml" (
                echo Processing for [%%D\%%~nxP]...
                pushd "%%P"
                set "PROJECT_OUT=%TEMP_FILE%.%%~nxP"
                cargo about generate --config "%ABOUT_CONFIG%" -o "!PROJECT_OUT!" "%ABOUT_TEMPLATE%" 2>nul
                if exist "!PROJECT_OUT!" (
                    type "!PROJECT_OUT!" >> "%TEMP_FILE%"
                    del "!PROJECT_OUT!"
                )
                popd
            )
        )
    )
)

echo.
echo Cleaning...

powershell -Command "$content = Get-Content '%TEMP_FILE%' -Encoding UTF8 | Where-Object { $_.Trim() -ne '' }; $unique = $content | Select-Object -Unique | Sort-Object; $formatted = $unique | ForEach-Object { $parts = $_ -split '\|'; if ($parts.Count -eq 5) { \"$($parts[0]) v$($parts[1])`n * $($parts[2])`n * Licensed under the $($parts[3])`n * $($parts[4])`n\" } }; $formatted | Out-File '%TEMP_FILE%.sorted' -Encoding UTF8"

echo Creating NOTICE...

(
type "%TEMPLATE_FILE%"
echo.
type "%TEMP_FILE%.sorted"
) > "%NOTICE_FILE%"

del "%TEMP_FILE%" 2>nul
del "%TEMP_FILE%.sorted" 2>nul

echo.
echo Success!

exit /b 0
