#!/bin/bash
# Created by Yevgeniy Gonvcharov
# Convert video file to gif with ffmpeg
#

# Checking arguments
if [ -z $1 ] || [ -z $2 ] ; then
  echo "Please use script with example - input-video.mp4 output.gif"
  exit 1
fi

# /mnt/dta4/vid/t/vokoscreen-2018-12-28_17-20-07.mp4 /mnt/dta4/vid/t/oit.gif
#

palette="/tmp/palette.png"
filters="fps=15,scale=320:-1:flags=lanczos"

ffmpeg -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
