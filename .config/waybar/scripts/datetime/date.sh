#!/bin/bash

windows=$(hyprctl activeworkspace -j | \
    jq '.windows'
)
nwindows=$((windows))

workspace=$(hyprctl activeworkspace | \
    grep "workspace" | \
    head -n 1 | \
    sed "s|.*(||; s|).*||"
)
nworkspace=$((workspace))

is_there_rofi=$(hyprctl clients | \
    grep "rofi" -A 5 | \
    grep "workspace" | \
    head -n 2 | \
    tail -n 1 | \
    sed "s|.*workspace: ||; s|(.*||"
)
nrofi=$((is_there_rofi))

is_there_todos=$(hyprctl clients | \
    grep "todos" -A 5 | \
    grep "workspace" | \
    head -n 2 | \
    tail -n 1 | \
    sed "s|.*workspace: ||; s|(.*||"
)
ntodos=$((is_there_todos))

is_there_notes=$(hyprctl clients | \
    grep "quicknote" | \
    grep "workspace" | \
    head -n 2 | \
    tail -n 1 | \
    sed "s|.*workspace: ||; s|(.*||"
)
nnotes=$((is_there_notes))

if [[ "${nrofi}" -eq "${nworkspace}" ]]; then
    ((nwindows--))
fi

if [[ "${nnotes}" -eq "${nworkspace}" ]]; then
    ((nwindows--))
fi

if [[ "${ntodos}" -eq "${nworkspace}" ]]; then
    ((nwindows--))
fi

if [[ "${nwindows}" -eq 0 ]]; then
    DATE=$(date +"%B %d, %Y")

    printf '{"text": "%s"}' "${DATE}"
else
    printf '{"text": ""}'
fi

