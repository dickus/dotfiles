export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dickus"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
alias gs="git status"
alias work="sudo openvpn --cd ~/.ya_vpn --config ~/.ya_vpn/openvpn.conf"
alias nvimt="nvim -u $HOME/.config/nvim/text_nvim.lua"
alias battery="./.config/scripts/gamepad-battery.sh"


export PF_INFO="ascii os kernel wm editor shell pkgs uptime memory"
export PF_COL2="0"

eval "$(zoxide init --cmd cd zsh)"

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin/
