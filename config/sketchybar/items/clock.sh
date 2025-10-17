#!/usr/bin/env sh

add_item() {
  sketchybar --add item clock right \
    --set clock \
    icon=󰃰 \
    icon.color=0xffed8796 \
    update_freq=10 \
    script="$PLUGIN_SHARED_DIR/clock.sh"
}
