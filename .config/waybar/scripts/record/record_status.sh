#!/usr/bin/env bash

STATUS=$(pidof wf-recorder)

if [[ -z ${STATUS} ]]; then
    printf '{"class": "off"}'
else
    printf '{"class": "on"}'
fi

