#!/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

mic_status=$(pactl get-source-mute @DEFAULT_SOURCE@ | sed "s/Mute: //")

if [[ "$mic_status" == "yes" ]]; then
    notify-send -t 1000 -i /usr/share/icons/Nordzy/devices/24/audio-input-microphone.svg "Microphone" "Muted"
else
    notify-send -t 1000 -i /usr/share/icons/Nordzy/devices/24/audio-input-microphone.svg "Microphone" "Unmuted"
fi

