#!/bin/bash

lock="⏾ Lock"
logout="⏼ Logout"
shutdown="⏻ Shutdown"
reboot="⟳ Reboot"

selected_option=$(echo -e "${lock}\n${logout}\n${reboot}\n${shutdown}" | \
    rofi -dmenu \
    -p "Power:" \
    -i \
    -theme-str "window { width: 7%; }" \
    -theme-str "listview { lines: 4; }"
)

case "${selected_option}" in
    "${lock}") hyprlock ;;
    "${logout}") hyprctl dispatch exit ;;
    "${shutdown}") systemctl poweroff ;;
    "${reboot}") systemctl reboot ;;
esac

