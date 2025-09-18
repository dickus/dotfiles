#!/usr/bin/env bash

action=${1}

idle() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        pkill -f "waybar/config-left" &
        pkill -f "waybar/config-right"

        hyprctl keyword cursor:invisible true
    fi
}

resume() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        hyprctl reload

        hyprctl keyword cursor:invisible false
    fi
}

[[ "${action}" == "idle" ]] && idle

[[ "${action}" == "resume" ]] && resume

