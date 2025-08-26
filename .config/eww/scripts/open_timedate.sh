#!/bin/bash

workspace=$(hyprctl activeworkspace | \
    grep "[w]orkspace" | \
    head -n 1 | \
    sed "s|.*ID ||; s|(.*||"
)

windows=$(hyprctl activeworkspace | \
    grep "[w]indows" | \
    sed "s|.*: ||"
)

mapfile -t floating < <(hyprctl clients | grep "[w]orkspace: ${workspace}" -A 1 | grep "floating" | sed "s|.*: ||")

non_float=false
if [[ "${floating}" ]]; then
    for item in "${floating[@]}"; do
        if [[ "${item}" == "0" ]]; then
            non_float=true

            break
        fi
    done
fi

if [[ ${windows} -eq 0 ]] || ! [[ ${non_float} ]]; then
    eww update open_timedate=true

    eww update open_zentime=false
else
    if ! pgrep -x "waybar" > /dev/null; then
        eww update open_timedate=false

        eww update open_zentime=true
    else
        eww update open_timedate=false

        eww update open_zentime=false
    fi
fi

