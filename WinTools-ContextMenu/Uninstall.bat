@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

set TARGET_DIR=C:\ProgramData\WinTools

echo Desinstalando WinTools-ContextMenu...
reg delete "HKCR\Directory\Background\shell\Tools" /f >nul 2>&1
reg delete "HKCR\Directory\Background\shell\Planos de Energia" /f >nul 2>&1

if exist "%TARGET_DIR%" rmdir /s /q "%TARGET_DIR%"

echo Desinstalacao concluida!
pause
