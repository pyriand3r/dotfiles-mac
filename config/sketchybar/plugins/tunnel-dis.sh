#!/bin/sh

NAME=${1}

osascript -e 'tell application "Tunnelblick"
    disconnect "'"${NAME}"'"
    get state of first configuration where name = "'"$NAME"'"
    repeat until result = "EXITING"
        delay 1
        get state of first configuration where name = "'"$NAME"'"
    end repeat
end tell'
