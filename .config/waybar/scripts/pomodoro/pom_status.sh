#!/bin/bash

STATUS=$(pidof -x pom_timer.sh)
TIMER=1500
minutes=$((TIMER / 60))

if [[ ${STATUS} ]]; then
    time=$(cat ${HOME}/.config/waybar/scripts/pomodoro/status)

    echo ${time}
else
    printf '{"text": "", "class": "off", "tooltip": "%s"}' "Timer is set to ${minutes}mins.\n\nLMB to start/stop.\nRMB to reset timer to 25mins.\nWheel up to +5mins.\nWheel down to -5mins."
fi

