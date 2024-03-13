@echo off
:MENU
cls
echo:
echo ..................................
echo Charlie Server - PXE Imaging Menu V1.0
echo ..................................
set IMAGESDRIVE=
for %%a in (C D E F G H I) do @if exist %%a:\Windows\ set IMAGESDRIVE=%%a
::echo Found %IMAGESDRIVE%
if not "%IMAGESDRIVE%" == "" (    
 diskpart /s diskpart.txt
 echo:
 echo Windows has been found on drive %IMAGESDRIVE%:
 echo This system may not have been wiped. Please Check.
)
set M=""
echo.
echo 1 - Win7-x64-TT - Install
echo 2 - Win10-x64-min - Install
echo 3 - Win7-x64 - Install
echo 4 - Review failed install logs
echo 5 - Check Disk Encryption
echo 6 - Exit to DOS
echo:
SET /P M=Type 1, 2, 3, 4, 5, or 6 then press ENTER:  
IF Not %M%==1 GOTO G2
echo Win10-x64-TT - Install
for /F "tokens=1" %%i in (version-tt.txt) do set dir=%%i
cd %dir%
setup
cd ..
goto MENU

:G2
if not %M%==2 goto G3
echo Win10-x64 min - Install
for /F "tokens=1" %%i in (version-min.txt) do set dir=%%i
cd %dir%
setup
cd ..
goto MENU


:G3
if not %M%==3 goto G4
echo Win7-x64 - Install
cd windows7x64home
setup
cd ..
goto MENU

:G4
if not %M%==4 goto G5
start notepad X:\Windows\Panther\setupact.log
goto menu

:G5
if not %M%==6 goto G6
cscript bitlocker.vbs
pause
goto menu

:G6
if not %M%==5 goto MENU
echo Exit to DOS. 
echo To return to menu type MENU at DOS prompt
echo To reboot type Exit
