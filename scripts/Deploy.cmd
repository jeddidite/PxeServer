:: Switch current install.wim to a new one (without breaking anything)
:: version.txt has the current production version 1 or 2
echo off
for /F "tokens=1" %%i in (version.txt) do set dir=%%i
:: echo Current Version %version%
SET version=%dir:~-1%
if %version% == 1 (
    SET new_version=2
) else if %version% == 2 (
    SET new_version=1
) else (
    echo Error image name suffix %version% must be a 1 or a 2 
   
)

SET new_dir=%dir:~0,-1%%new_version%
:: echo Next Version %new_version%
echo Do you want to replace
dir %dir%\install.wim
echo with
echo.
dir %new_dir%\install.wim
set /P "image_ok=Are you sure Y/[N] "
if "%image_ok%"=="" goto EXIT
if /I not "%image_ok%"=="Y" goto EXIT
echo OK
echo %new_dir% < version.txt
:EXIT