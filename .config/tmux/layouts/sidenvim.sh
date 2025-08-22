#!/bin/bash

TERMINAL="${1}"
session_name="${2}"
path="${3}"

[[ -z "${session_name}" ]] && session_name="sidenvim"
tmux has-session -t "${session_name}"

if [[ $? != 0 ]]; then
    cd ${path}

    tmux new-session -ds "${session_name}"
    tmux set-window-option -t "${session_name}" allow-rename off
    tmux rename-window -t "${session_name}":1 random-overview

    tmux send-keys -t "${session_name}":1.1 'nvim' C-m
    tmux split-window -v -p 50 -t "${session_name}":1
    tmux send-keys -t "${session_name}":1.2 'nvim' C-m

    tmux select-pane -t 1
fi

${TERMINAL} -e tmux a -t "${session_name}"

