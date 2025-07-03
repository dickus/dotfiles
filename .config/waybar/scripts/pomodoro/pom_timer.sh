#!/bin/bash

TIMER=$1
CHILL_TIME=5

while true; do
    for (( work = TIMER; work >= 0; work-- )); do
        minutes=$((work / 60))
        seconds=$((work % 60))

        printf '{"text": "%02d:%02d ", "class": "on_work"}' "$minutes" "$seconds" > $HOME/.config/waybar/scripts/pomodoro/status

        sleep 1
    done

    dunstify -t 2000 "Time to chill!"

    for (( chill = TIMER; chill >= 0; chill-- )); do
        minutes=$((chill / 60))
        seconds=$((chill % 60))

        printf '{"text": "%02d:%02d ", "class": "on_chill"}' "$minutes" "$seconds" > $HOME/.config/waybar/scripts/pomodoro/status

        sleep 1
    done

    dunstify -t 2000 -u criticial "Time to work!"
done

