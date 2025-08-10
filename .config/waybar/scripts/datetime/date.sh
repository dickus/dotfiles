#!/bin/bash

windows=$(hyprctl activeworkspace -j | jq '.windows')
nwindows=$((windows))

is_there_rofi=$(hyprctl clients | grep "rofi")
is_there_todos=$(hyprctl clients | grep "todos")
is_there_notes=$(hyprctl clients | grep "quicknote")

if [[ "${is_there_rofi}" ]]; then
    ((nwindows--))
fi

if [[ "${is_there_todos}" ]]; then
    ((nwindows--))
fi

if [[ "${is_there_notes}" ]]; then
    ((nwindows--))
fi

if [[ "${nwindows}" -eq 0 ]]; then
    DATE=$(date +"%B %d, %Y")

    printf '{"text": "%s"}' "${DATE}"
else
    printf '{"text": ""}'
fi

