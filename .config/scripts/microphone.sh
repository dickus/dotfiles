#!/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

mic_status=$(pactl get-source-mute @DEFAULT_SOURCE@ | sed "s/Mute: //")

if [[ "$mic_status" == "yes" ]]; then
    notify-send -t 1000 -i $HOME/.icons/light/audio-input-microphone-muted.svg "Microphone" "Muted"
else
    notify-send -t 1000 -i $HOME/.icons/light/audio-input-microphone.svg "Microphone" "Unmuted"
fi

