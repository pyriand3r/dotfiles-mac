#!/usr/bin/env sh

NAME="$1"
CHECK="$2"

if test "$CHECK" = "true"; then
  status=( $( osascript -e 'tell application "Tunnelblick" to get state of first configuration where name = "'$NAME'"' ) )
else
  status=( $(osascript <<EOF
tell application "Tunnelblick"
    get state of first configuration where name = "$NAME"
   if result = "EXITING"
       connect "$NAME"
       repeat until result = "CONNECTED"
            delay 1
            get state of first configuration where name = "$NAME"
        end repeat
   else
       disconnect "$NAME"
       repeat until result = "EXITING"
            delay 1
            get state of first configuration where name = "$NAME"
      end repeat
    end if
end tell
EOF) )
fi

#status=( $( osascript -e 'tell application "Tunnelblick" to get state of first configuration where name = "'$NAME'"' ) )

background=0xffa6da95
color=0xff24273a

if test "$status" = "EXITING"; then
  background=0x66494d64
  color=0xff959595
fi

sketchybar --set tunnelblick icon=󱠽 background.color=$background icon.color=$color
