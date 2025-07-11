@echo off
REM === CONFIGURATION VARIABLES ===
set BASE_DIR=C:\Users\kevinp\source\repos\TechnoDbVnext\
set DEPLOYMENT_PATH=\\tp-dc-apps01\sandbox

set SITE_DIR=%BASE_DIR%\Techno.AttendanceBoard.Site
set SITE_OUTPUT=%DEPLOYMENT_PATH%\blazor-dashboard

:TITLE
cls
echo ================================
echo P O J E C T   D E P L O Y M E N T
echo ================================
echo Base Directory:    %BASE_DIR%
echo Site Directory:    %SITE_DIR%
echo Deployment Target: %DEPLOYMENT_PATH%
echo.

:MENU
echo ===== Deployment Options =====
echo 1. Deploy Site only  (%SITE_OUTPUT%)
echo 2. Exit
echo.

set /p choice="Select option (1-2): "

if "%choice%"=="1" goto DEPLOY_SITE
if "%choice%"=="2" exit
echo Invalid selection. Please choose 1-2.
pause
goto TITLE

:DEPLOY_SITE
echo [Site] Publishing to %SITE_OUTPUT%
cd /d "%SITE_DIR%"
dotnet publish -c Release -f net9.0 -o "%SITE_OUTPUT%"
echo Site deployment complete.
pause
goto TITLE