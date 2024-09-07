#!/bin/bash

if [[ -z "$1" ]]; then
    echo -e '\033[1mon "<file_name>"'

    exit 1
fi

file_name=$(echo "$1" | tr ' ' '-')
formatted_file_name=$(date "+%Y-%m-%d")_${file_name}.md
cd "$HOME/.docs" || exit
touch "drafts/${formatted_file_name}"
nvim "drafts/${formatted_file_name}"

