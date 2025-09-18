#!/usr/bin/env bash

MODE="${1}"
script="${HOME}/.config/hypr/scripts/zen"
mode_file="${script}/mode"

zen() {
    echo "zen" > "${mode_file}"

    killall waybar

    hyprctl keyword general:gaps_out 100, 200
}

nobars() {
    echo "nobars" > "${mode_file}"

    killall waybar

    hyprctl keyword general:gaps_out 8
}

bars() {
    echo "bars" > "${mode_file}"

    WAYBAR_CONFIG=~/.config/waybar/config-left waybar -c ~/.config/waybar/config-left -s ~/.config/waybar/style.css &

    hyprctl keyword general:gaps_out 8, 8, 8, 2
}

case "${MODE}" in
    zen)
        if ! [[ $(cat ${HOME}/.config/hypr/scripts/zen/mode) == "zen" ]]; then
            "${MODE}"
        else
            nobars
        fi ;;
    bars)
        if ! [[ $(cat ${HOME}/.config/hypr/scripts/zen/mode) == "bars" ]]; then
            "${MODE}"
        else
            nobars
        fi ;;
esac

