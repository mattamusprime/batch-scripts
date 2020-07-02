@echo off
FOR /F "tokens=*" %%i IN ('echo %1^| sed -E "s/[^a-z0-9]+/./gi" ^| sed "s/[\.\(\)]/ /g" ^| sed -E "s/((1|2)[0-9]{3}).+/(\1)/g" ^| sed -E "s/(^ +| +$)//gi"') DO set VARIABLE=%%i
rem sed -E "s/\.*(remastered|uncut|hq|(720|1080)p).*//gi"
rem echo "%VARIABLE%"
FOR /F "tokens=*" %%i IN ('echo %1^| sed -E "s/.*\.([a-z0-9]+).*/\1/gi"') DO set EXT=%%i
set OUTPUTNAME=%VARIABLE%.%EXT%
echo %OUTPUTNAME%

if "%~2"=="y" goto performname
goto :done

:performname
@echo on
move "%~1" "%OUTPUTNAME%"

:done
