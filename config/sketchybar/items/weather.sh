#!/usr/bin/env sh

add_item () {
  sketchybar --add item weather.moon q \
     --set weather.moon \
     background.color=0x667dc4e4 \
     background.padding_right=-1 \
     icon.color=0xff181926 \
     icon.font="$FONT_FACE:Bold:22.0" \
     icon.padding_left=4 \
     icon.padding_right=3 \
     label.drawing=off \
     --subscribe weather.moon mouse.clicked

}
