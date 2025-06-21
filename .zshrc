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

# find a file by name and edit with nvim
alias vif="~/.config/scripts/fzf/neofzf_name.sh"
# find a file by content and edit with nvim
alias vic="~/.config/scripts/fzf/neofzf_cont.sh"

alias fetch="fastfetch"

# proper calendar
alias cal="cal -m"

# cat to bat
alias bat="bat --theme gruvbox-light"
alias cat="bat"

alias grep="rg"

# copying, moving, removing
alias cp="cp -uv"
alias mv="mv -uv"
alias rm="rm -Rvf"

# ls to exa
alias ls="exa -F"

# create dirs faster
alias mkdir="mkdir -vp"

# set system themes
alias theme="~/.config/scripts/theme_change/theme_changer.sh"

# notes workflow
alias ww="cd ~/.docs && nvim ."
alias on="~/.config/scripts/obsidian/new_file.sh"
alias or="cd ~/.docs && nvim drafts/*.md"

# create a python environment
alias pe="python -m venv"

# add new wallpaper
alias wall="~/.config/scripts/wallpapers/new_wallpaper.sh"

# system update
alias upd="yay; flatpak update"

# stop misspelling yay you shithead
alias ayy="echo 'limao'"

# yay management
alias yai="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias yar="yay -Qq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -Rns"

# in case if something breaks
alias fuck="touch $HOME/.config/scripts/fuck"

# rng, literally
alias rng="~/.config/scripts/random.sh"

# flatpaks management
alias fpi="flatpak remote-ls flathub --columns=application | fzf --multi --preview 'flatpak remote-info flathub {1}' --preview-window=down:75% | xargs -ro flatpak install -y"
alias fpr="flatpak list --app --columns=application | fzf --multi --preview 'flatpak info {1}' --preview-window=down:75% | xargs -ro flatpak uninstall -y"

export SUDO_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"


eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec startx
fi

