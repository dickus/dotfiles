#!/bin/bash

action=$1

idle() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        pkill -f "waybar/config-left"
        pkill -f "waybar/config-right"
    fi
}

resume() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        pkill -f "waybar/config-left"
        pkill -f "waybar/config-right"

        WAYBAR_CONFIG=~/.config/waybar/config-left waybar -c ~/.config/waybar/config-left -s ~/.config/waybar/style.css &
        WAYBAR_CONFIG=~/.config/waybar/config-right waybar -c ~/.config/waybar/config-right -s ~/.config/waybar/style.css &
    fi
}

[[ "${action}" == "idle" ]] && idle

[[ "${action}" == "resume" ]] && resume

