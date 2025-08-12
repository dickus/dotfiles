#!/bin/bash

zen() {
    pkill -f "waybar/config-left" &
    pkill -f "waybar/config-right"

    hyprctl keyword general:gaps_out 8
}

nozen() {
    hyprctl reload
}

if [[ $(ps aux | grep "waybar/config-left" | wc -l) != "1" ]]; then
    zen
else
    nozen
fi

