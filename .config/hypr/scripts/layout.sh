#!/usr/bin/env bash

layout=$(hyprctl devices -j | jq -r '.keyboards[] | .active_keymap' | head -1)

if [[ "${layout}" == *"English"* ]]; then
    dunstify -t 1000 "Layout" "RUSSIAN"

    hyprctl keyword input:kb_layout ru
else
    dunstify -t 1000 "Layout" "ENGLISH"

    hyprctl keyword input:kb_layout us
fi

