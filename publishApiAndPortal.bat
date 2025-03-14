@echo off
REM Define directory paths
set API_DIR=C:\Users\lakinduk\Source\Repos\TechnoDbVnext\Techno.Portal.Api
set SITE_DIR=C:\Users\lakinduk\Source\Repos\TechnoDbVnext\Techno.Potal.Site
set OUTPUT_DIR=\\tp-dc-apps01\sandbox

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
dotnet publish -c Release -f net9.0 -o "%OUTPUT_DIR%\blazor-portal"

pause