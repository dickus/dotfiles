#!/bin/bash

env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/1 &

wowup-cf

env "$HOME/PortProton/data/scripts/start.sh" "$HOME/PortProton/data/prefixes/BATTLE_NET/drive_c/Program Files (x86)/Battle.net/Battle.net.exe"

