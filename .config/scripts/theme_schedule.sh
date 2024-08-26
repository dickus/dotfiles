#!/bin/zsh

theme="$1"

case $theme in
    light)
        sed -i 's|/themes/.*.toml|/themes/gruvbox-light.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/gruvbox-light.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes.*"|themes.gruvbox-light"|' $HOME/.config/nvim/init.lua
        sed -i 's|themes.*"|themes.gruvbox-light"|' $HOME/.config/nvim/text_nvim.lua
        sed -i 's|/themes/.*.ini|/themes/gruvbox-light.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/gruvbox-light.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/gruvbox-light.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "gruvbox-light"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/volume.sh ;;

    dark)
        sed -i 's|/themes/.*.toml|/themes/gruvbox-dark.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/gruvbox-dark.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes.*"|themes.gruvbox-dark"|' $HOME/.config/nvim/init.lua
        sed -i 's|themes.*"|themes.gruvbox-dark"|' $HOME/.config/nvim/text_nvim.lua
        sed -i 's|/themes/.*.ini|/themes/gruvbox-dark.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/gruvbox-dark.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/gruvbox-dark.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "gruvbox-dark"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/volume.sh ;;
esac

bspc wm -r
source .zshrc

