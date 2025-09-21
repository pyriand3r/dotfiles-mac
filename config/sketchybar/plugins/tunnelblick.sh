#!/bin/sh

NAME="$1"

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

#status=( $( osascript -e 'tell application "Tunnelblick" to get state of first configuration where name = "'$NAME'"' ) )

if test "$status" = "EXITING"; then
    sketchybar --set tunnelblick icon=󱠽 icon.color=0xff959595
else
    sketchybar --set tunnelblick icon=󱠾 icon.color=0xffa6da95
fi

sketchybar --update
