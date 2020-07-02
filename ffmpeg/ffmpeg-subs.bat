@echo off

if [%1]==[] goto usage
if [%3]==[] goto noext

echo ext
FOR /F "tokens=*" %%i IN ('sanitize-name.bat %1^| sed -E "s/(.+)\.[^. ]+/\1/g"') DO set VARIABLE=%%i
set OUTPUTNAME=%VARIABLE%.%~3

:encode
echo "%OUTPUTNAME%"
ffmpeg -i "%~1" -i "%~2" -c copy -c:s mov_text -metadata:s:s:0 language=eng "%OUTPUTNAME%"

goto :eof

:noext
echo noext
FOR /F "tokens=*" %%i IN ('sanitize-name.bat %1') DO set VARIABLE=%%i
set OUTPUTNAME=%VARIABLE%
goto :encode

:usage
@echo Usage: %0 input-video input-subs extension
exit /B 1