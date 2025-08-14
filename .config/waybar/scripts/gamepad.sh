#!/bin/bash

HIGH="high"
MID="mid"
LOW="low"

DEVICE=$(upower -e | grep -iE 'gip|gamepad' | sort -u)

if [[ ${DEVICE} ]]; then
    percent=$(upower -i "${DEVICE}" | grep -Po 'percentage:\s*\K\d+')

    if [[ ${percent} -eq 100 ]]; then
        printf '{"text": "", "class": "%s", "tooltip": "%s"}' "${HIGH}" "${percent}%"
    elif [[ ${percent} -gt 74 && ${percent} -ne 100 ]]; then
        printf '{"text": "", "class": "%s", "tooltip": "%s"}' "${HIGH}" "${percent}%"
    elif [[ ${percent} -gt 49 && ${percent} -lt 75 ]]; then
        printf '{"text": "", "class": "%s", "tooltip": "%s"}' "${MID}" "${percent}%"
    elif [[ ${percent} -gt 24 && ${percent} -lt 50 ]]; then
        printf '{"text": "", "class": "%s", "tooltip": "%s"}' "${MID}" "${percent}%"
    else
        printf '{"text": "", "class": "%s", "tooltip": "%s"}' "${LOW}" "${percent}%"
    fi
else
    printf '{"text": ""}'
fi

