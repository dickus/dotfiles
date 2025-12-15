#!/usr/bin/env zsh

TERMINAL="${1}"
SESSION_NAME="${2}"
WORK_DIR="${3}"

[[ -z "${SESSION_NAME}" ]] && SESSION_NAME="sidecode"

tmux has-session -t "${SESSION_NAME}" 2>/dev/null

if [[ $? != 0 ]]; then
    if [[ -n "${WORK_DIR}" && -d "${WORK_DIR}" ]]; then
        cd "${WORK_DIR}"
    fi

    tmux new-session -ds "${SESSION_NAME}"
    tmux set-window-option -t "${SESSION_NAME}" allow-rename off
    tmux rename-window -t "${SESSION_NAME}":1 random-overview

    tmux send-keys -t "${SESSION_NAME}":1.1 'nvim' C-m
    tmux split-window -v -p 15 -t "${SESSION_NAME}":1
    tmux send-keys -t "${SESSION_NAME}":1.2 'yazi' C-m

    tmux select-pane -t 2
    tmux split-window -h -p 50 -t "${SESSION_NAME}":1

    tmux select-pane -t 1
fi

${TERMINAL} -e tmux a -t "${SESSION_NAME}"

