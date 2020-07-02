echo "DOES NOT PRESERVE MODIFICATION TIME"

for %%f in (%~1) do (
    echo %%~nf
    ffmpeg -i "%%~f" -c:v libx265 -preset ultrafast -b:v "%~2" "%%~nf.small.mp4"
)