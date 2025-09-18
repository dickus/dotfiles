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


alias dfs="./.config/scripts/df.sh"

alias vi="nvim"

# find a file by name and edit with nvim
alias vif="~/.config/scripts/fzf/neofzf_name.sh"
# find a file by content and edit with nvim
alias vic="~/.config/scripts/fzf/neofzf_cont.sh"

alias fetch="fastfetch"

# proper calendar
alias cal="cal -m"

alias grep="rg"

# copying, moving, removing
alias cp="cp -uv"
alias mv="mv -uv"
alias rm="rm -Rvf"

# ls to exa
alias ls="exa -F"

# create dirs faster
alias mkdir="mkdir -vp"

# notes workflow
alias ww="cd ~/.docs && nvim ."
alias or="cd ~/.docs && nvim drafts/*.md"

# create a python environment
alias pe="python -m venv"

# system update
alias upd="paru; flatpak update"

# paru management
alias pai="paru -Slq | fzf --multi --preview 'paru -Sii --needed {1}' --preview-window=down:75% | xargs -ro paru -S"
alias par="paru -Qq | fzf --multi --preview 'paru -Sii {1}' --preview-window=down:75% | xargs -ro paru -Rns"

# in case if something breaks
alias fuck="touch $HOME/.config/scripts/fuck"

# rng, literally
alias rng="~/.config/scripts/random.sh"

# flatpaks management
fpi() {
    flatpak remote-ls flathub --columns=application,branch |
    awk '!x[$1]++' |
    fzf --multi --preview 'flatpak remote-info flathub {1}/x86_64/{2}' --preview-window=down:75% --with-nth 1 |
    awk '{print $1}' |
    xargs -ro flatpak install -y
}

alias fpr="flatpak list --app --columns=application | fzf --multi --preview 'flatpak info {1}' --preview-window=down:75% | xargs -ro flatpak uninstall -y"

alias pushd="pushd ${1} >/dev/null"
alias popd="popd >/dev/null"

export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"


eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec startx
fi

