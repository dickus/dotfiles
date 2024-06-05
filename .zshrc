export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dickus"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


function preexec() {
  timer=$(($(date +%s%0N)*0.000000001))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)*0.000000001))
    elapsed=$(echo $(($now-$timer)) | awk '{printf "%.3f", $1}')

    export RPROMPT="%F{cyan}${elapsed}s %{$reset_color%}"
    unset timer
  fi
}


alias dfs="df -h / /home"
alias nvimt="nvim -u ~/.config/nvim/text_nvim.lua"
alias battery="./.config/scripts/gamepad-battery.sh"


export PF_INFO="ascii os kernel wm editor shell pkgs uptime memory"
export PF_COL2="0"

eval "$(zoxide init --cmd cd zsh)"

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dickus/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dickus/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dickus/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dickus/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2024-05-28 19:05:57
export PATH="$PATH:/home/dickus/.local/bin"
