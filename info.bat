@echo off
setlocal enabledelayedexpansion

systeminfo>%temp%\info.txt
for /f "tokens=2 delims=:" %%a in ('findstr /c:"Registered Owner" %temp%\info.txt') do set owner=%%a
for /f "tokens=2 delims=:" %%a in ('findstr /c:"OS Name" %temp%\info.txt') do set osname=%%a
for /f "tokens=2 delims=:" %%a in ('findstr /c:"System Manufacturer" %temp%\info.txt') do set manufacture=%%a
for /f "tokens=2 delims=:" %%a in ('findstr /c:"Product ID" %temp%\info.txt') do set productkey=%%a
del %temp%\info.txt

set owner=%owner: =%
set osname=%osname: =%
set manufacture=%manufacture: =%
set productkey=%productkey: =%

if /I "%processor_architecture%" EQU "x86_64" set arch=x64
if /I "%processor_architecture%" EQU "AMD64" set arch=x64
if /I "%processor_architecture%" EQU "x86" set arch=x32

echo.
echo Username: %username%
echo Hostname: %computername%
echo OS: %osname%
echo Owner: %owner%
echo Product Key: %productkey%
echo Processors: %number_of_processors%
echo Manufacturer: %manufacture%
