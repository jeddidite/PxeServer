@ECHO OFF
echo "Startnet Windows 10 PXE -  version 2.5"
wpeinit
echo Looking for server...
set /a counter=1
:LOOP1
echo Attempt %counter%
set /a counter+=1
ping 192.168.0.1
if errorlevel 1 GOTO LOOP1
echo Found server
call wait 3
net stop ikeext
call wait 1
echo Mounting share...
net use Y: \\192.168.0.1\images
if not errorlevel 1 GOTO NEXT1
echo Failed to mount  \\192.168.0.1\images
echo try running startnet.cmd again
goto FINISH

:NEXT1
echo Done that
Y:
menu.cmd
:FINISH
cmd /c
pause
