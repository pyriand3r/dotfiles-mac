#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=0xfff5a97f label.color=0xff24273a
else
    sketchybar --set $NAME background.color=0xff444444 label.color=0x668AADF5
fi
