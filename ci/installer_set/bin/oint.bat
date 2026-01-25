@echo off
set "oint_folder=%~dp0"
call "%oint_folder%..\lib\oint\bin\oscript.exe" "%oint_folder%..\share\oint\lib\oint-cli\core\Classes\app.os" %*
@exit /b %ERRORLEVEL%
