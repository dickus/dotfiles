#!/bin/bash

COUNT=$(dunstctl count waiting)
ENABLED=
DISABLED=󱏫

if [[ ${COUNT} != 0 ]]; then
    DISABLED="󰂞"
fi

if dunstctl is-paused | grep -q "false"; then
    printf '{"text": "%s", "class": "enabled"}' "${ENABLED}"
else
    printf '{"text": "%s", "class": "disabled"}' "${DISABLED}"
fi

