ffmpeg -i "%~1" -f mp4 -vcodec mpeg4 -b:v 3000000 -acodec libvo_aacenc -ac 2 -b:a 128000 -s 1280x720 -threads 6 "%~n1.mp4"