#!/usr/bin/env bash

FILE="$1"
MODE="$2"

if file --mime-type -b "${FILE}" | grep -q '^image/'; then
    if [[ "${MODE}" == "rotate" ]]; then
        magick "${FILE}" -rotate 90 "${FILE}"
    elif [[ "${MODE}" == "rotate_back" ]]; then
        magick "${FILE}" -rotate -90 "${FILE}"
    elif [[ "${MODE}" == "flip" ]]; then
        magick "${FILE}" -flip "${FILE}"
    elif [[ "${MODE}" == "flop" ]]; then
        magick "${FILE}" -flop "${FILE}"
    fi
fi

