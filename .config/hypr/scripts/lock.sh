#!/bin/bash

windows=$(hyprctl activeworkspace -j | jq '.windows')

if [[ "${windows}" == "0" ]]; then
    hyprlock
fi


