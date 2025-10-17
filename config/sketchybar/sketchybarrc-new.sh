#!/usr/bin/env zsh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$HOME/.config/sketchybar/items"

FONT_FACE="JetBrainsMono Font Mono"

export NERD_FONT="JetBrainsMono Font Mono"
export PADDINGS_SMALL=2
export PADDINGS=6
export PADDINGS_LARGE=16

#source "$HOME/conf/sketchybar/colors.sh"
#source "$HOME/conf/sketchybar/icons.sh"
#source "$HOME/conf/sketchybar/helper/helper.sh"

##### Bar Appearance #####
bar_config=(
	blur_radius=0
	color=$(get_color TRANSPARENT)
	corner_radius=0
	height=40
	margin=0
	notch_width=222
	padding_left=$PADDINGS
	padding_right=$PADDINGS
	position=top
	shadow=off
	sticky=on
	topmost=window
)

icon_defaults=(
	icon.color="$(get_color TEXT 100)"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.padding_left=$PADDINGS
	icon.padding_right=0
)

label_defaults=(
	label.color="$(get_color TEXT 100)"
	label.font="$FONT:Semibold:13.0"
	label.padding_left=$PADDINGS
	label.padding_right=$PADDINGS
)

background_defaults=(
	background.corner_radius=9
	background.height=30
	background.padding_left="$PADDINGS"
	background.padding_right="$PADDINGS"
)

popup_defaults=(
	popup.height=30
	popup.horizontal=off
	popup.background.border_color="$(get_color LIME 80)"
	popup.background.border_width=2
	popup.background.color="$(get_color ASH 80)"
	popup.background.corner_radius=11
	popup.background.shadow.drawing=on
)

# Item styling defaults
item_style=(
	background.color="$(get_color GREY 20)"
	background.corner_radius=12
	background.height=28
	background.drawing=on
	background.padding_left=0
	background.padding_right=0
)

# Setting up the general bar appearance and default values
sketchybar --bar "${bar_config[@]}" \
	--default \
	updates=when_shown \
	"${icon_defaults[@]}" \
	"${label_defaults[@]}" \
	"${background_defaults[@]}" \
	"${popup_defaults[@]}"

##### Events #####
sketchybar --add event aerospace_workspace_change

##### Left Area Items #####
LEFT_AREA=(
	"aerospace"
	"menu"
	"batt"
	"public"
	"running"
	"net"
	"app"
)

CENTER_AREA=(
	"datetime"
)

##### Right Area Items #####
RIGHT_AREA=(
	"weather"
	"datetime"
	"meetings"
	"notifs"
)

##### Load Items #####
for item in "${LEFT_AREA[@]}"; do
	if [ -f "$ITEM_DIR/${item}.sh" ]; then
		source "$ITEM_DIR/${item}.sh"
		add_item left
	fi
done

for item in "${CENTER_AREA[@]}"; do
	if [ -f "$ITEM_DIR/${item}.sh" ]; then
		source "$ITEM_DIR/${item}.sh"
		add_item center
	fi
done

for item in "${RIGHT_AREA[@]}"; do
	if [ -f "$ITEM_DIR/${item}.sh" ]; then
		source "$ITEM_DIR/${item}.sh"
		add_item right
	fi
done

##### Force all scripts to run the first time #####
sketchybar --update
