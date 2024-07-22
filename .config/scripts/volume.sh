#!/bin/bash

volume_change="$1"

case "$volume_change" in
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP "\b\d{1,2}(?=%)" | head -n 1)
        if [ "$current_volume" -eq 0 ]; then
            notify-send -t 1000 -i /usr/share/icons/Nordzy/actions/24/audio-volume-muted.svg "Volume down" "Muted"
        else
            notify-send -t 1000 -i /usr/share/icons/Nordzy/actions/24/audio-volume-low.svg "Volume down" "$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')"
        fi;;
    up) pactl set-sink-volume @DEFAULT_SINK@ +5% && notify-send -t 1000 -i /usr/share/icons/Nordzy/actions/24/audio-volume-high.svg "Volume up" "$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')";;
esac

