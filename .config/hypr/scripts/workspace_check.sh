#!/bin/bash

action=$1

idle() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        pkill -f "waybar/config-left" &
        pkill -f "waybar/config-right"

        hyprctl keyword cursor:inactive_timeout 0.1
    fi
}

resume() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        WAYBAR_CONFIG=~/.config/waybar/config-left waybar -c ~/.config/waybar/config-left -s ~/.config/waybar/style.css &
        WAYBAR_CONFIG=~/.config/waybar/config-right waybar -c ~/.config/waybar/config-right -s ~/.config/waybar/style.css &

        hyprctl keyword cursor:inactive_timeout 0
    fi
}

[[ "${action}" == "idle" ]] && idle

[[ "${action}" == "resume" ]] && resume

