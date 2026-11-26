@echo off
lua "%~dp0publish-addins.lua" %*
exit /b %ERRORLEVEL%
