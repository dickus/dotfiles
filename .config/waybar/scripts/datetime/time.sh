#!/bin/bash

windows=$(hyprctl activeworkspace -j | jq '.windows')

is_there_rofi=$(hyprctl clients | grep "rofi")
is_there_todos=$(hyprctl clients | grep "todos")
is_there_notes=$(hyprctl clients | grep "quicknote")

if [[ "${is_there_rofi}" ]]; then
    ((windows--))
fi

if [[ "${is_there_todos}" ]]; then
    ((windows--))
fi

if [[ "${is_there_notes}" ]]; then
    ((windows--))
fi

if [[ "${windows}" -eq 0 ]]; then
    TIME=$(date +"%H:%M")

    printf '{"text": "%s"}' "${TIME}"
else
    printf '{"text": ""}'
fi

