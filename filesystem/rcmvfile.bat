@echo off

IF [%1] == [] GOTO PrintUsage
IF [%2] == [] GOTO PrintUsage

set currentfolder=%cd%
set destinationfolder=%~2
set filetocopy=%~1

IF %destinationfolder:~-1%==\ SET destinationfolder=%destinationfolder:~0,-1%
IF %filetocopy:~-1%==\ SET filetocopy=%filetocopy:~0,-1%

@echo on
robocopy "%currentfolder%" "%destinationfolder%" "%filetocopy%" /MOV

GOTO Done

:PrintUsage
echo "File to Copy: filename of a file in the current directory you want copied"
echo "Destination: where to copy the file"
echo "Usage: rcfile filetocopy C:\example"

:Done