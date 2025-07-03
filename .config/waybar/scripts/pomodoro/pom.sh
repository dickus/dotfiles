#!/bin/bash

STATUS=$(pidof -x pom_timer.sh)
TIMER=1500

if [[ -z $STATUS ]]; then
    if [[ $1 == "start" ]]; then
        $HOME/.config/waybar/scripts/pomodoro/pom_timer.sh $TIMER
    fi

    if [[ $1 == "set_plus" ]]; then
        TIMER=$(($TIMER + 300))

        sed -i "4s|.*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom.sh
        sed -i "s|TIMER=[0-9].*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom_status.sh
    fi

    if [[ $1 == "set_minus" ]]; then
        TIMER=$(($TIMER - 300))

        sed -i "4s|.*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom.sh
        sed -i "s|TIMER=[0-9].*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom_status.sh
    fi

    if [[ $1 == "reset" ]]; then
        TIMER=1500

        sed -i "4s|.*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom.sh
        sed -i "s|TIMER=[0-9].*|TIMER=${TIMER}|" $HOME/.config/waybar/scripts/pomodoro/pom_status.sh
    fi
else
    pkill -9 pom_timer.sh
fi

