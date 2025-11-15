#!/usr/bin/env bash

MODE="${1}"
script="${HOME}/.config/hypr/scripts/zen"
mode_file="${script}/mode"
theme_conf="${HOME}/.config/hypr/conf/theme.conf"

zen() {
    echo "zen" > "${mode_file}"

    sed -i "2s|.*||" "${theme_conf}"

    sed -i "s|gaps_out =.*|gaps_out = 150, 250|" "${theme_conf}"

    hyprctl reload
}

nobars() {
    echo "nobars" > "${mode_file}"

    sed -i "2s|.*||" "${theme_conf}"

    sed -i "s|gaps_out =.*|gaps_out = 8|" "${theme_conf}"

    hyprctl reload
}

bars() {
    echo "bars" > "${mode_file}"

    sed -i "2s|.*|exec = WAYBAR_CONFIG=~/.config/waybar/config-left waybar -c ~/.config/waybar/config-left -s ~/.config/waybar/style.css \&|" "${theme_conf}"

    sed -i "s|gaps_out =.*|gaps_out = 8, 8, 8, 2|" "${theme_conf}"

    hyprctl reload
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

