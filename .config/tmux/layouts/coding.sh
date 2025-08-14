#!/bin/bash

TERMINAL="${1}"
session_name="${2}"
path="${3}"

tmux has-session -t "${session_name}"

if [[ $? != 0 ]]; then
    cd ${path}

    tmux new-session -ds "${session_name}"
    tmux set-window-option -t "${session_name}" allow-rename off
    tmux rename-window -t "${session_name}":1 random-overview

    tmux send-keys -t "${session_name}":1.1 'yazi' C-m
    tmux split-window -h -p 70 -t "${session_name}":1
    tmux send-keys -t "${session_name}":1.2 'nvim' C-m

    tmux select-pane -t 1
    tmux split-window -v -p 25 -t "${session_name}":1

    tmux select-pane -t 3
    tmux split-window -v -p 50 -t "${session_name}":1
    tmux send-keys -t "${session_name}":1.4 'nvim' C-m

    tmux select-pane -t 1
fi

${TERMINAL} -e tmux a -t "${session_name}"

