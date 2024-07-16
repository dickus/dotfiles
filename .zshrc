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
alias nvimt="nvim -u ~/.config/nvim/text_nvim.lua"
alias battery="./.config/scripts/gamepad-battery.sh"
alias fetch="fastfetch"
alias cal="cal -m"
alias inv="./.config/scripts/neofzf.sh"
alias cat="bat --theme gruvbox-light"
alias bat="bat --theme gruvbox-light"


eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)


export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin/
