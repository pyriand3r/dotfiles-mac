#!/usr/bin/env sh


#source_file="flow-time.txt"
#
#if [ -f "$source_file" ]; then
#  flowtime=$(cat "$source_file")
#else
#  flowtime="25:00"
#fi

source_file="flow-status.txt"
flowstatus=$(cat "$source_file")

colorBreak="0xFF8AADF5" # blue
colorPause="0x66ED8796" #red
colorRun="0xFFA4D894" # green
#colorBreak="0x66EFA57C" # yellow

labelColorDark="0xff24273a"
labelColorLight="0xffcad3f5"

#update=1
color=$colorRun
labelColor="$labelColorDark"
phase=( $(osascript -e 'tell application "Flow" to getPhase') )
time=( $(osascript -e 'tell application "Flow" to getTime'))

#if test "$time" = "$flowtime"; then
#  phase="Off"
#else
#  echo "$time" > $source_file
#fi

if test "$flowstatus" = "stopped"; then
  phase="Off"
fi

if test $phase = "Break"; then
  color=$colorBreak
elif test "$phase" = "Off"; then
  color=$colorPause
  labelColor=$labelColorLight
#  update=60
fi

sketchybar --set flow label="$time" background.color="$color" label.color="$labelColor"
