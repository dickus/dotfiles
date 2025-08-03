#!/bin/bash

TEMP=$(hyprctl hyprsunset temperature)

DAY=""
NIGHT="󰖔"

if [[ "$TEMP" = "6000" ]]; then
    printf '{"text": "%s"}' "$DAY"
else
    printf '{"text": "%s", "class": "on"}' "$NIGHT"
fi

if [[ "$1" == "toggle" ]]; then
    if [[ "$TEMP" -eq 6000 ]]; then
        hyprctl hyprsunset temperature 4500

        $HOME/.config/scripts/theme_change/theme_schedule.sh dark
    else
        hyprctl hyprsunset temperature 6000; hyprctl hyprsunset identity

        $HOME/.config/scripts/theme_change/theme_schedule.sh light
    fi
fi

if [[ "$1" == "light" ]]; then
    if [[ "$TEMP" -eq 6000 ]]; then
        hyprctl hyprsunset temperature 4500
    else
        hyprctl hyprsunset temperature 6000; hyprctl hyprsunset identity
    fi
fi

