@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

set TARGET_DIR=C:\ProgramData\WinTools

:MENU
cls
echo ============================================================
echo           WinTools-ContextMenu - Menu de Instalacao
echo ============================================================
echo.
echo  [1] Instalar TUDO (Tools + Planos de Energia)
echo  [2] Instalar Apenas o Menu "Tools"
echo  [3] Instalar Apenas o Menu "Planos de Energia"
echo  [4] Sair
echo.
echo ============================================================
set /p OPTION="Escolha uma opcao (1-4): "

if "%OPTION%"=="1" goto INSTALL_ALL
if "%OPTION%"=="2" goto INSTALL_TOOLS
if "%OPTION%"=="3" goto INSTALL_POWER
if "%OPTION%"=="4" exit /b
goto MENU

:INSTALL_ALL
call :DO_TOOLS
call :DO_POWER
goto SUCCESS

:INSTALL_TOOLS
call :DO_TOOLS
goto SUCCESS

:INSTALL_POWER
call :DO_POWER
goto SUCCESS

:DO_TOOLS
echo.
echo Copiando scripts de otimizacao para %TARGET_DIR%...
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
copy /Y "%~dp0src\scripts\Limpar-Temp.ps1" "%TARGET_DIR%\" >nul
copy /Y "%~dp0src\scripts\Limpar-RAM.ps1" "%TARGET_DIR%\" >nul
echo Aplicando registro do Menu Tools...
reg import "%~dp0src\registry\Tools.reg" >nul
exit /b

:DO_POWER
echo.
echo Ativando planos de energia ocultos...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo Aplicando registro do Menu Planos de Energia...
reg import "%~dp0src\registry\PlanosDeEnergia.reg" >nul
exit /b

:SUCCESS
echo.
echo ============================================================
echo   INSTALACAO CONCLUIDA COM SUCESSO!
echo ============================================================
echo.
pause
