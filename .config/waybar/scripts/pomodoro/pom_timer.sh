#!/bin/bash

TIMER=$1
CHILL_TIME=300

while true; do
    dunstify -a work -t 2000 -u criticial "Time to work!"

    for (( work = TIMER; work >= 0; work-- )); do
        minutes=$((work / 60))
        seconds=$((work % 60))

        printf '{"text": "%02d:%02d ", "class": "on_work"}' "$minutes" "$seconds" > $HOME/.config/waybar/scripts/pomodoro/status

        sleep 1
    done

    dunstify -a chill -t 2000 "Time to chill!"

    for (( chill = CHILL_TIME; chill >= 0; chill-- )); do
        minutes=$((chill / 60))
        seconds=$((chill % 60))

        printf '{"text": "%02d:%02d ", "class": "on_chill"}' "$minutes" "$seconds" > $HOME/.config/waybar/scripts/pomodoro/status

        sleep 1
    done
done

