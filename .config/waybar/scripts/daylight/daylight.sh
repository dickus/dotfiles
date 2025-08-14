#!/bin/bash

TEMP=$(hyprctl hyprsunset temperature)

DAY=""
NIGHT="󰖔"

THEME_SCRIPT="${HOME}/.config/scripts/theme_change/theme_schedule.sh"

get_current_theme() {
    grep -oP "${1}=\"\K[^\"]+" "${THEME_SCRIPT}" | tail -n 1
}

if [[ $(grep "6000" ${HOME}/.config/waybar/scripts/daylight/daylight) ]]; then
    printf '{"text": "%s"}' "${DAY}"
else
    printf '{"text": "%s", "class": "on"}' "${NIGHT}"
fi

if [[ "${1}" == "toggle" ]]; then
    if [[ -z $(grep "dark" ${HOME}/.config/scripts/system/microphone.sh) ]]; then
        ${HOME}/.config/scripts/theme_change/theme_schedule.sh dark
    else
        ${HOME}/.config/scripts/theme_change/theme_schedule.sh light
    fi
fi

if [[ "${1}" == "light" ]]; then
    if [[ -z $(grep "6000" ${HOME}/.config/waybar/scripts/daylight/daylight) ]]; then
        hyprctl hyprsunset identity

        echo "6000" > ${HOME}/.config/waybar/scripts/daylight/daylight
    else
        hyprctl hyprsunset temperature 4500

        echo "4500" > ${HOME}/.config/waybar/scripts/daylight/daylight
    fi
fi

