tell application "Tunnelblick"
    connect "gkrebs"
    get state of first configuration where name = "gkrebs"
    repeat until result = "CONNECTED"
        delay 1
        get state of first configuration where name = "gkrebs"
    end repeat
end tell
