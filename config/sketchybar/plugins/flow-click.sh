#!/usr/bin/env sh

source_file="flow-status.txt"

colorBreak="0xFF8AADF5" # blue
colorPause="0x66ED8796" #red
colorRun="0xFFA4D894" # green
#colorBreak="0x66EFA57C" # yellow
labelColorDark="0xff24273a"
labelColorLight="0xffcad3f5"

phase=( $(osascript -e 'tell application "Flow" to getPhase') )
color=""
labelColor=""
update=1

if [ -f "$source_file" ]; then
  status=$(cat "$source_file")
else
  status="stopped"
fi

if test "$status" = "running"; then
  osascript -e 'tell application "Flow" to stop'
  status="stopped"
  color=$colorPause
  labelColor=$labelColorLight
  update=0
else
  osascript -e 'tell application "Flow" to start'
  status="running"
  color=$colorRun
  labelColor=$labelColorDark
  if test "$phase" = "Break"; then
    color=$colorBreak
  fi
  update=1
fi

sketchybar --set flow background.color="$color" update_freq="$update" label.color=$labelColor

echo "$status" > $source_file
