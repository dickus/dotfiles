#!/usr/bin/env bash

zen() {
    killall waybar

    hyprctl keyword general:gaps_out 100, 200
}

nozen() {
    hyprctl reload
}

if [[ $(ps aux | grep "waybar/config-left" | wc -l) != "1" ]]; then
    zen
else
    nozen
fi

