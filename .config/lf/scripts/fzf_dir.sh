#!/bin/sh

dir=$(find /home -type d | fzf)

if [ -n "$dir" ]; then
    lf -remote "send $id cd \"$dir\""
fi

