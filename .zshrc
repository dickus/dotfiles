export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dickus"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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


alias dfs="./.config/scripts/misc/df.sh"

alias vi="nvim"

alias ff="fastfetch"

alias pg="ps -eo pid,user,pcpu,pmem,comm --sort=-%mem | grep -v grep | grep ${1}"

# proper calendar
alias cal="cal -m"

# copying, moving, removing
alias cp="cp -uv"
alias mv="mv -uv"
alias rm="rm -Rvf"

# ls to exa
alias ls="exa -F"

# create dirs faster
alias mkdir="mkdir -vp"

# create a python environment
alias pe="source $HOME/.config/scripts/dev/python_venv.sh"
alias cdp="source $HOME/.config/scripts/dev/cd_python.sh"

# in case if something breaks
alias fuck="touch $HOME/.config/scripts/fuck"

alias pushd="pushd ${1} >/dev/null"
alias popd="popd >/dev/null"

export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"

export PATH="$PATH:$HOME/.local/bin"

eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec startx
fi

