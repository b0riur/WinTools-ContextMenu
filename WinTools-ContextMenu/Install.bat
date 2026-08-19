@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

set TARGET_DIR=C:\ProgramData\WinTools

echo Instalando WinTools-ContextMenu...
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

copy /Y "%~dp0src\scripts\Limpar-Temp.ps1" "%TARGET_DIR%\" >nul
copy /Y "%~dp0src\scripts\Limpar-RAM.ps1" "%TARGET_DIR%\" >nul

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

reg import "%~dp0src\registry\Tools.reg" >nul
reg import "%~dp0src\registry\PlanosDeEnergia.reg" >nul

echo Instalacao concluida com sucesso!
pause
