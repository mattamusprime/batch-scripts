@echo off
for %%f in (*.avi, *.mkv, *.mp4) do (
	echo %%~f
	call print-encoder "%%~f"
)