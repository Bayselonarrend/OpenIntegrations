@echo off
setlocal enabledelayedexpansion

echo ========================================
echo Checking Dependencies for Vulnerabilities
echo ========================================
echo.

REM Check if cargo is installed
where cargo >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Cargo not found. Install Rust: https://rustup.rs/
    exit /b 1
)

REM Check if cargo-audit is installed
cargo audit --version >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [INFO] cargo-audit not installed. Installing...
    cargo install cargo-audit
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] Failed to install cargo-audit
        exit /b 1
    )
)

REM List of Rust project directories
set "PROJECTS=crypto ftp grpc mongodb mssql mysql postgres rcon sqlite ssh tcp_client tcp_server"

echo.
echo Found projects to check:
for %%p in (%PROJECTS%) do (
    if exist "%%p\Cargo.toml" (
        echo   - %%p
    )
)
echo.

set /a TOTAL=0
set /a FAILED=0
set /a VULNERABLE=0

for %%p in (%PROJECTS%) do (
    if exist "%%p\Cargo.toml" (
        set /a TOTAL+=1
        echo ----------------------------------------
        echo Checking: %%p
        echo ----------------------------------------
        
        pushd "%%p"
        
        REM Check for vulnerabilities
        cargo audit 2>&1
        set AUDIT_RESULT=!ERRORLEVEL!
        
        if !AUDIT_RESULT! neq 0 (
            set /a VULNERABLE+=1
            echo.
            echo [WARNING] Vulnerabilities found in %%p
            echo.
            echo Attempting to update dependencies...
            cargo update
            
            echo.
            echo Re-checking after update...
            cargo audit 2>&1
            if !ERRORLEVEL! neq 0 (
                set /a FAILED+=1
                echo [ERROR] Vulnerabilities remain after update in %%p
            ) else (
                echo [SUCCESS] Vulnerabilities fixed in %%p
            )
        ) else (
            echo [OK] No vulnerabilities found in %%p
        )
        
        popd
        echo.
    )
)

echo ========================================
echo Summary
echo ========================================
echo Total projects checked: %TOTAL%
echo Projects with vulnerabilities: %VULNERABLE%
echo Projects with unresolved vulnerabilities: %FAILED%
echo.

if %FAILED% gtr 0 (
    echo [WARNING] Manual intervention required!
    echo Check the output above for details.
    exit /b 1
) else if %VULNERABLE% gtr 0 (
    echo [SUCCESS] All vulnerabilities fixed automatically.
    exit /b 0
) else (
    echo [SUCCESS] No vulnerabilities detected.
    exit /b 0
)
