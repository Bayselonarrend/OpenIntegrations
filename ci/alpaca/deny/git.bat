@echo off
lua "%~dp0git.lua" %*
exit /b %ERRORLEVEL%
