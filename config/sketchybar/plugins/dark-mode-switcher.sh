#!/bin/sh

switch=$1

if test "$switch" = "true"; then
  echo "switch"
  osascript <<EOF
  tell app "System Events" to tell appearance preferences to set dark mode to not dark mode
EOF
fi

darkMode=( $(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode') )

background=0xffeed49f
icon=0xff24273a

if test "$darkMode" = "true"; then
  background=0xff8aadf4
fi

sketchybar --set dark_mode icon.color="$icon" background.color="$background"
