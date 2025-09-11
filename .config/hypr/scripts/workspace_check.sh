#!/usr/bin/env bash

action=${1}

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
        hyprctl reload

        hyprctl keyword cursor:inactive_timeout 0
    fi
}

[[ "${action}" == "idle" ]] && idle

[[ "${action}" == "resume" ]] && resume

