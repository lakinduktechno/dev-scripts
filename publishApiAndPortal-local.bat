@echo off
REM Update below path to the root directory of the project
set BASE_DIR=C:\Users\lakinduk\Source\Repos\TechnoDbVnext

set API_DIR=%BASE_DIR%\Techno.Portal.Api
set SITE_DIR=%BASE_DIR%\Techno.Potal.Site
set OUTPUT_DIR=C:\Users\lakinduk\Source\published\latest

REM Navigate to the API directory
cd /d "%API_DIR%"

REM Run the project with the specified framework
echo Publishing Techno Portal Api...
dotnet publish -c Release -f net9.0 -o "%OUTPUT_DIR%\blazor-api"

REM Wait for user input to continue
echo Press any key to continue to the next step...
pause

REM Navigate to the Portal Site directory
cd /d "%SITE_DIR%"

REM Run the project with the specified framework
echo Publishing Techno Blazor Portal Site...
dotnet publish -c Release -f net9.0 -o "%OUTPUT_DIR%\blazor-portal" /p:ContinuousIntegrationBuild=true

pause