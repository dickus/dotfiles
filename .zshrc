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


alias dfs="df -h / /home"
alias vi="nvim"
alias vif="~/.config/scripts/neofzf_name.sh"
alias vic="~/.config/scripts/neofzf_cont.sh"
alias fetch="fastfetch"
alias cal="cal -m"
alias bat="bat --theme gruvbox-light"
alias cat="bat"
alias grep="rg"
alias cp="cp -uv"
alias mv="mv -uv"
alias rm="rm -Rvf"
alias ls="exa -F"
alias mkdir="mkdir -vp"
alias theme="~/.config/scripts/theme_change/theme_changer.sh"
alias ww="cd ~/.docs && nvim ."
alias on="~/.config/scripts/obsidian/new_file.sh"
alias or="cd ~/.docs && nvim drafts/*.md"
alias pe="python -m venv"

export SUDO_EDITOR="nvim"
export EDITOR="nvim"


eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec startx
fi

