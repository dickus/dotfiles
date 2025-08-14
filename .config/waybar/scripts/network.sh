#!/bin/bash

STATUS=$(nmcli device status | grep '^enp.* connected')
VPN=$(ifconfig | grep "vpn")

if [[ "$1" ]]; then
    if [[ "${STATUS}" ]]; then
        nmcli device status | grep "enp.*" | sed "s|[[:space:]].*||" | xargs -ro nmcli device disconnect
    else
        nmcli device status | grep "enp.*" | sed "s|[[:space:]].*||" | xargs -ro nmcli device connect
    fi
fi

if [[ "${VPN}" ]]; then
    printf '{"text": "", "class": "vpn"}'
elif [[ "${STATUS}" ]]; then
    printf '{"text": "", "class": "connected"}'
else
    printf '{"text": "󰈀", "class": "disconnected"}'
fi

