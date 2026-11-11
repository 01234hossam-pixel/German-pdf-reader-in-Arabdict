@echo off
setlocal
title German PDF Reader - Install
set "DEST=%LOCALAPPDATA%\GermanPDFReader"
set "BROWSER="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER (
  echo Chrome or Edge was not found. Please install one of them and run this file again.
  pause
  exit /b 1
)
mkdir "%DEST%" 2>nul
copy /Y "%~dp0pdf-reader-local.html" "%DEST%\index.html" >nul
copy /Y "%~dp0german-flag.ico" "%DEST%\german-flag.ico" >nul
copy /Y "%~dp0uninstall.bat" "%DEST%\uninstall.bat" >nul
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0make-shortcut.ps1" -Browser "%BROWSER%" -Dest "%DEST%"
if errorlevel 1 (
  echo Could not create the shortcut.
  pause
  exit /b 1
)
echo.
echo Done. "German PDF Reader" is now on your Desktop and in the Start menu.
pause
