:: Append Master Image to install.wim
@echo off
dism /image:d:\ /get-currentedition
set /P "image_ok=Is this the Windows10-x64 Home image you want to capture Y/[N]"
if "%image_ok%"=="" goto EXIT
if /I not "%image_ok%"=="Y" goto EXIT
for /F "tokens=1" %%i in ('date /t') do set today=%%i
for /F "tokens=1" %%i in (version.txt) do set dir=%%i
:: echo Current Version %version%
SET version=%dir:~-1%
if %version% == 1 (
    SET dev_version=2
) else if %version% == 2 (
    SET dev_version=1
) else (
    echo Error image name suffix %version% must be a 1 or a 2  
)

SET dev_dir=%dir:~0,-1%%dev_version%
:: echo Dev Version %dev_dir%
dism /get-imageinfo /imagefile:"%dev_dir%\install.wim"
set /P "image_ok=Is this the Windows10-x64 Pro image you want to append Y/[N]"
if "%image_ok%"=="" goto EXIT
if /I not "%image_ok%"=="Y" goto EXIT
time /t
echo on

dism /Append-Image /imagefile:"%dev_dir%\install.wim" /CaptureDir:d:\ /Name:"Windows10-x64 Core" /Description:"Windows10-x64 Core %today%"  /ConfigFile:WimScript.ini
time /t
dism /get-imageinfo /imagefile:"%dev_dir%\install.wim"
:EXIT