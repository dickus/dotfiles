#!/bin/bash

windows=$(hyprctl activeworkspace -j | jq '.windows')

action="${1}"

case "${action}" in
    "lock") [[ "${windows}" == "0" ]] && hyprlock ;;
    "suspend") [[ "${windows}" == "0" ]] && systemctl suspend ;;
esac


