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
alias fetch="fastfetch"
alias cal="cal -m"
alias nvimf="~/.config/scripts/neofzf.sh"
alias cat="bat --theme gruvbox-light"
alias bat="bat --theme gruvbox-light"
alias grep="rg"
alias cp="cp -uv"
alias mv="mv -uv"
alias rm="sudo rm -Rv"
alias ls="exa -F"
alias mkdir="mkdir -v"
alias find="fd"


eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)


export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin/
