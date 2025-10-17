#!/usr/bin/env sh

add_item() {
  sketchybar -m --add item dark_mode right \
    --set dark_mode \
        icon= \
        icon.color=0xffa6da95 \
        icon.y_offset=1 \
        icon.padding_left=7 \
        icon.padding_right=1 \
        click_script="$PLUGIN_SHARED_DIR/dark-mode-switcher.sh true" \
        script="$PLUGIN_SHARED_DIR/dark-mode-switcher.sh"
}
