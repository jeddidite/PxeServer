:: Connect to Window share
:: November 2019 philn
@echo off
echo "Connect Windows 10 -  version 3.2"
set server=192.168.0.1
echo Looking for server...
set /a counter=1
:LOOP1
echo Attempt %counter%
set /a counter+=1
ping %server%
if errorlevel 1 GOTO LOOP1
echo Found server
call wait 3
net stop ikeext
echo Mounting share...
net use Y: \\%server%\images$ /user:user1
if errorlevel 0 GOTO NEXT1
echo Failed to mount  \\%server%\images$
goto FINISH

:NEXT1
pause
Y:
:FINISH