#!/usr/bin/env sh

add_item() {
  sketchybar -m --add item flow right \
    --set flow \
        label.drawing=true \
        label.padding_left=-5 \
        label.padding_right=6 \
        click_script="$PLUGIN_SHARED_DIR/flow-click.sh" \
        script="$PLUGIN_SHARED_DIR/flow.sh"
}
