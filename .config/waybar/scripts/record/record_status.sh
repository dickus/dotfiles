#!/bin/bash

STATUS=$(pidof ffmpeg)

if [[ -z $STATUS ]]; then
    printf '{"class": "off"}'
else
    printf '{"class": "on"}'
fi

