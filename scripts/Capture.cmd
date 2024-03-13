:: Capture master image in install.wim
@echo off
set im=Windows10-x64-tt Pro
dism /image:d:\ /get-currentedition
set /P "image_ok=Is this the %im% image you want to capture Y/N "
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
time /t
echo on

dism /Capture-Image /imagefile:"%dev_dir%\install.wim" /CaptureDir:d:\ /Name:"%im%" /Description:"%im% %today%" 

time /t
dism /get-imageinfo /imagefile:"%dev_dir%\install.wim"
:EXIT