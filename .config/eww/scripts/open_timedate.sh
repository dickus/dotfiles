#!/bin/bash

while true; do
    timedate="$(eww get open_timedate)"

    windows=1

    workspace=$(hyprctl activeworkspace | \
        grep "[w]orkspace" | \
        head -n 1 | \
        sed "s|.*ID ||; s|(.*||"
    )

    mapfile -t floating < <(hyprctl clients | grep "[w]orkspace: ${workspace}" -A 1 | grep "floating" | sed "s|.*: ||")

    for item in "${floating[@]}"; do
        if [[ "${item}" == "0" ]]; then
            windows=0

            break
        fi
    done

    if [[ ${windows} -eq 1 ]]; then
        eww update open_timedate=true
    else
        eww update open_timedate=false
    fi

    sleep 1
done

