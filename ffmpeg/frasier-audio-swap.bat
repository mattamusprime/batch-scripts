ffmpeg -fflags +genpts -i "%~1" -map 0:v:0 -map 0:a:1 -map 0:a:0 -metadata:s:a:0 language=eng -metadata:s:a:1 language=ita -c copy "%~n1.mkv"