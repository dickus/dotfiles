#!/bin/bash

theme="$1"

case $theme in
    everforest)
        sed -i '1s|.*|import = ["~/.config/alacritty/colors/everforest.toml",]|' $HOME/.config/alacritty/alacritty.toml
        sed -i '3s|.*|source $HOME/.config/bspwm/colors/everforest.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i "2s|.*|require('colors.everforest')|" $HOME/.config/nvim/init.lua
        sed -i "2s|.*|require('colors.everforest')|" $HOME/.config/nvim/text_nvim.lua
        sed -i '2s|.*|include-file = ~/.config/polybar/colors/everforest.ini|' $HOME/.config/polybar/config.ini
        sed -i '1s|.*|@theme "~/.config/rofi/themes/everforest.rasi"|' $HOME/.config/rofi/config.rasi
        sed -i '1s|.*|@import "~/.config/rofi/themes/everforest.rasi"|' $HOME/.config/rofi/powermenu.rasi
        sed -i '1s|.*|theme "everforest"|' $HOME/.config/zellij/config.kdl ;;

    gruvbox)
        sed -i '1s|.*|import = ["~/.config/alacritty/colors/gruvbox.toml",]|' $HOME/.config/alacritty/alacritty.toml
        sed -i '3s|.*|source $HOME/.config/bspwm/colors/gruvbox.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i "2s|.*|require('colors.gruvbox')|" $HOME/.config/nvim/init.lua
        sed -i "2s|.*|require('colors.gruvbox')|" $HOME/.config/nvim/text_nvim.lua
        sed -i '2s|.*|include-file = ~/.config/polybar/colors/gruvbox.ini|' $HOME/.config/polybar/config.ini
        sed -i '1s|.*|@theme "~/.config/rofi/themes/gruvbox.rasi"|' $HOME/.config/rofi/config.rasi
        sed -i '1s|.*|@import "~/.config/rofi/themes/gruvbox.rasi"|' $HOME/.config/rofi/powermenu.rasi
        sed -i '1s|.*|theme "gruvbox"|' $HOME/.config/zellij/config.kdl ;;

    nord)
        sed -i '1s|.*|import = ["~/.config/alacritty/colors/nord.toml",]|' $HOME/.config/alacritty/alacritty.toml
        sed -i '3s|.*|source $HOME/.config/bspwm/colors/nord.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i "2s|.*|require('colors.nord')|" $HOME/.config/nvim/init.lua
        sed -i "2s|.*|require('colors.nord')|" $HOME/.config/nvim/text_nvim.lua
        sed -i '2s|.*|include-file = ~/.config/polybar/colors/nord.ini|' $HOME/.config/polybar/config.ini
        sed -i '1s|.*|@theme "~/.config/rofi/themes/nord.rasi"|' $HOME/.config/rofi/config.rasi
        sed -i '1s|.*|@import "~/.config/rofi/themes/nord.rasi"|' $HOME/.config/rofi/powermenu.rasi
        sed -i '1s|.*|theme "nord"|' $HOME/.config/zellij/config.kdl ;;

    *)
        echo "everforest"
        echo "gruvbox"
        echo "nord" ;;
esac

bspc wm -r

