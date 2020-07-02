echo "DOES NOT PRESERVE MODIFICATION TIME"
ffmpeg -i "%~1" -c:v libx265 -preset ultrafast -b:v "%~2" "%~n1.small.mp4"