@echo off

if [%1]==[] goto usage
if [%4]==[] goto noext

echo ext
FOR /F "tokens=*" %%i IN ('sanitize-name.bat %1^| sed -E "s/(.+)\.[^. ]+/\1/g"') DO set VARIABLE=%%i
set OUTPUTNAME=%VARIABLE%.%~4

:encode
echo "%OUTPUTNAME%"
ffmpeg -i "%~1" -i "%~2" -i "%~3" -map 0:v -map 0:a -c copy -map 1 -c:s:1 dvd_subtitle -metadata:s:s:1 language=eng "%OUTPUTNAME%"
goto :eof

:noext
echo noext
FOR /F "tokens=*" %%i IN ('sanitize-name.bat %1') DO set VARIABLE=%%i
set OUTPUTNAME=%VARIABLE%
goto :encode

:usage
@echo Usage: %0 input-video idx-file subs-file extension
exit /B 1