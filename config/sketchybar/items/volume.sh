#!/usr/bin/env sh

add_item() {
  sketchybar --add item volume right \
    --set volume \
    icon.color=0xff8aadf4 \
    label.drawing=true \
    script="$PLUGIN_SHARED_DIR/volume.sh" \
    --subscribe volume volume_change
}
