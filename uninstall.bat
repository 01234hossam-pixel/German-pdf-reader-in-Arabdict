@echo off
setlocal
set "DEST=%LOCALAPPDATA%\GermanPDFReader"
del "%USERPROFILE%\Desktop\German PDF Reader.lnk" 2>nul
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\German PDF Reader.lnk" 2>nul
cd /d "%TEMP%"
rmdir /S /Q "%DEST%" 2>nul
echo German PDF Reader was removed.
pause
