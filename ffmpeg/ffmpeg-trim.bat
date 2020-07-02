::ffmpeg -ss [start] -i in.mp4 -t [duration] -c copy out.mp4

@echo off
ffmpeg -ss %2 -i "%~1" -t %3 -c copy "%~n1-cut%~x1"