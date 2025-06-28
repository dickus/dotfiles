#!/bin/env bash

lock="⏾ Lock"
logout="⏼ Logout"
shutdown="⏻ Shutdown"
reboot="⟳ Reboot"

selected_option=$(echo "$lock
$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "SFMono Nerd Font Mono 10"\
                  -scrollbar-width "0"
)

if [ "$selected_option" == "$lock" ]
then
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        hyprlock
    else
        ~/.config/bspwm/scripts/i3lock-fancy/i3lock-fancy.sh
    fi
elif [ "$selected_option" == "$logout" ]
then
    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        hyprctl dispatch exit
    else
        bspc quit
    fi
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
else
    echo "No match"
fi
