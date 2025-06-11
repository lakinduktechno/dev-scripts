@echo off
REM Update below path to the root directory of the project
set BASE_DIR=C:\Users\lakinduk\Source\Repos\TechnoDbVnext

set SITE_DIR=%BASE_DIR%\Techno.Database.Site
set OUTPUT_DIR=\\tp-dc-apps01\sandbox


REM Wait for user input to continue
echo Press any key to publish blazor-sandbox...
pause

REM Navigate to the Portal Site directory
cd /d "%SITE_DIR%"

REM Run the project with the specified framework
echo Publishing Techno Database Blazor Site...
dotnet publish -c Release -f net9.0 -o "%OUTPUT_DIR%\blazor-sandbox" 

pause