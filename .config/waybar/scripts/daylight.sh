#!/bin/bash

TEMP=$(hyprctl hyprsunset temperature)

DAY=""
NIGHT="󰖔"

if [[ "$TEMP" = "6000" ]]; then
    printf '{"text": "%s"}' "$DAY"
else
    printf '{"text": "%s", "class": "on"}' "$NIGHT"
fi

if ! [[ -z "$1" ]]; then
    if [[ "$TEMP" -eq 6000 ]]; then
        hyprctl hyprsunset temperature 4500
    else
        hyprctl hyprsunset temperature 6000; hyprctl hyprsunset identity
    fi
fi

