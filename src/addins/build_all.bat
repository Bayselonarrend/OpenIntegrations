@echo off
setlocal

for /d %%p in (*) do (
    if exist "%%p\release.bat" (
        echo.
        echo ========================================
        echo Building %%p...
        echo ========================================
        
        pushd %%p
        call release.bat
        if errorlevel 1 (
            echo ERROR: Build failed for %%p
            popd
            exit /b 1
        )
        popd
    )
)

echo.
echo ========================================
echo All projects built successfully!
echo ========================================
exit /b 0
