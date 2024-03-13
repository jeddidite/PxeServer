:: Connect to Window share
@echo off
echo "Connect Windows 10 wifi -  version 3.2"
:: pnputil /add-driver D:\Usb_wifi\Drivers\*.inf /install
net start wlansvc
netsh wlan add profile filename=\Murdoch.xml
set server=192.168.10.54
ipconfig
:: pnputil /enum-devices /class net
echo Looking for server...
set /a counter=1
:LOOP1
echo Attempt %counter%
set /a counter+=1
ping %server%
call wait 3
if errorlevel 1 GOTO LOOP1
echo Found server
call wait 3
net stop ikeext
echo Mounting share...
net use Y: \\%server%\images$ /user:user1
if errorlevel 0 GOTO NEXT1
echo Failed to mount  \\%server%\images$
:NEXT1
pause
Y:
:FINISH