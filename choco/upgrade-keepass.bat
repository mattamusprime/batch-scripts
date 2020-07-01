@echo off

IF "%~1"=="" GOTO usage

set hash=%~1
set hash=%hash: =%
echo %hash%

choco pin remove -n=keepass
choco upgrade keepass --checksum "%hash%"
choco pin add -n=keepass

GOTO end
:usage
echo upgrade-keepass "HASH"

:end