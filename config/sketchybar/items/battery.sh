#!/usr/bin/env sh

add_item() {
  sketchybar --add item battery right \
    --set battery \
    update_freq=20 \
    script="$PLUGIN_DIR/battery.sh"
}
