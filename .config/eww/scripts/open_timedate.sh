#!/bin/bash

while true; do
    floating_windows="true"

    workspace=$(hyprctl activeworkspace | \
        grep "[w]orkspace" | \
        head -n 1 | \
        sed "s|.*ID ||; s|(.*||"
    )

    mapfile -t floating < <(hyprctl clients | grep "[w]orkspace: ${workspace}" -A 1 | grep "floating" | sed "s|.*: ||")

    if [[ "${floating}" ]]; then
        for item in "${floating[@]}"; do
            if [[ "${item}" == "0" ]]; then
                floating_windows="false"

                break
            fi
        done
    else
        floating_windows="true"
    fi

    if [[ ${floating_windows} == "true" ]]; then
        eww update open_timedate=true

        eww update open_zentime=false
    else
        if [[ -z $(ps aux | grep "[w]aybar") ]]; then
            eww update open_zentime=true

            eww update open_timedate=false
        else
            eww update open_zentime=false

            eww update open_timedate=false
        fi
    fi

    sleep 1
done

