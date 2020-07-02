@echo off

if [%1]==[] goto usage
rem if [%2]==[] goto usage

FOR /F "tokens=*" %%i IN ('sanitize-name.bat %1') DO set VARIABLE=%%i
set OUTPUTNAME=%VARIABLE%
echo "%OUTPUTNAME%"

move "%1" "..\..\movies\%OUTPUTNAME%"
cd ..	

goto :eof

:usage
@echo Usage: %0 movie
exit /B 1