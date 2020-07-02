ffmpeg -i "%~1" -i "%~2" -c:s mov_text -metadata:s:s:0 language=eng -c:v libx265 -preset fast -x265-params crf=28 -threads 12 "%~n1.x265.eng.mp4"


::ffmpeg -i "%~1" -i "%~2" -c copy -c:s mov_text -metadata:s:s:0 language=eng "%~n1.eng%~x1"