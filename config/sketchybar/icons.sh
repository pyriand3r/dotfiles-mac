#!/usr/bin/env bash

icon_map() {
  case "$1" in
    "1Password") icon_result="" ;;
    "AeroSpace") icon_result="󰾍";;
    *) icon_result="󰂚" ;;
  esac
  echo "$icon_result"
}
