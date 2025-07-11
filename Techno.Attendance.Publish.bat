@echo off
REM === CONFIGURATION VARIABLES ===
set BASE_DIR=C:\Users\kevinp\source\repos\TechnoDbVnext
set DEPLOYMENT_PATH=\\tp-dc-apps01\sandbox

set API_DIR=%BASE_DIR%\Techno.Attendance.Api
set SITE_DIR=%BASE_DIR%\Techno.Attendance.Site
set API_OUTPUT=%DEPLOYMENT_PATH%\blazor-staffapp-api
set SITE_OUTPUT=%DEPLOYMENT_PATH%\blazor-staffapp

:TITLE
cls
echo ================================
echo P O J E C T   D E P L O Y M E N T
echo ================================
echo Base Directory:    %BASE_DIR%
echo Site Directory:    %SITE_DIR%
echo Api Directory:    	%API_DIR%
echo Deployment Target: %DEPLOYMENT_PATH%
echo.

:MENU
echo ===== Deployment Options =====
echo 1. Deploy API only   (%API_OUTPUT%)
echo 2. Deploy Site only  (%SITE_OUTPUT%)
echo 3. Deploy Both
echo 4. Exit
echo.

set /p choice="Select option (1-4): "

if "%choice%"=="1" goto DEPLOY_API
if "%choice%"=="2" goto DEPLOY_SITE
if "%choice%"=="3" goto DEPLOY_BOTH
if "%choice%"=="4" exit
echo Invalid selection. Please choose 1-4.
pause
goto TITLE

:DEPLOY_API
call :DEPLOY_API_RUN
goto TITLE

:DEPLOY_SITE
call :DEPLOY_SITE_RUN
goto TITLE

:DEPLOY_BOTH
echo [Both] Starting full deployment...
call :DEPLOY_API_RUN
call :DEPLOY_SITE_RUN
echo Both components deployed successfully.
pause
goto TITLE

:DEPLOY_API_RUN
echo [API] Publishing to %API_OUTPUT%
cd /d "%API_DIR%"
dotnet publish -c Release -f net9.0 -o "%API_OUTPUT%"
echo API deployment complete.
pause

:DEPLOY_SITE_RUN
echo [Site] Publishing to %SITE_OUTPUT%
cd /d "%SITE_DIR%"
dotnet publish -c Release -f net9.0 -o "%SITE_OUTPUT%"
echo Site deployment complete.
pause