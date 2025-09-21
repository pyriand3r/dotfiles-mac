#!/usr/bin/env sh

darkMode=( $(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode') )

echo $darkMode

color="0xffa6da95"
if test "$darkMode" = "true"; then
  color="0xff8aadf4"
fi

echo $color

sketchybar --set dark_mode icon.color="$color"
