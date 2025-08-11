#!/bin/bash

action=$1

idle() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        pkill -f "waybar/config-left"
        pkill -f "waybar/config-right"
    fi

    hyprctl keyword cursor:inactive_timeout 0.1
}

resume() {
    windows=$(hyprctl activeworkspace -j | jq '.windows')

    if [[ "${windows}" == "0" ]]; then
        hyprctl reload
    fi
}

[[ "${action}" == "idle" ]] && idle

[[ "${action}" == "resume" ]] && resume

