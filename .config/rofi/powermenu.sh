#!/bin/env bash

# Options for powermenu
lock="⏾ Lock"
logout="⏼ Logout"
shutdown="⏻ Shutdown"
reboot="⟳ Reboot"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "SFMono Nerd Font Mono 10"\
                  -scrollbar-width "0" )

# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    ~/.config/bspwm/scripts/i3lock-fancy/i3lock-fancy.sh
elif [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
else
    echo "No match"
fi
