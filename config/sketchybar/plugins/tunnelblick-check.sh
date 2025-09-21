#!/usr/bin/env sh

NAME=$1
status=( $( osascript -e 'tell application "Tunnelblick" to get state of first configuration where name = "'$NAME'"' ) )

if test "$status" = "EXITING"; then
    sketchybar --set tunnelblick icon=󱠽 icon.color=0xff959595
else
    sketchybar --set tunnelblick icon=󱠾 icon.color=0xffa6da95
fi
