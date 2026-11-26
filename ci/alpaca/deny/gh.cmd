@echo off
lua "%~dp0gh.lua" %*
exit /b %ERRORLEVEL%
