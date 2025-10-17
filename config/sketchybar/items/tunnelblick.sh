#!/usr/bin/env sh

add_item () {
sketchybar -m --add item tunnelblick right \
    --set tunnelblick \
        icon=󱠽 \
        icon.color=0xff959595 \
        icon.y_offset=1 \
        icon.padding_left=7 \
        icon.padding_right=1 \
        click_script="$PLUGIN_SHARED_DIR/tunnelblick.sh gkrebs" \
        script="$PLUGIN_SHARED_DIR/tunnelblick-check.sh gkrebs"
}
