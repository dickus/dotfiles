#!/bin/bash

theme="$1"

case $theme in
    light)
        sed -i 's|/themes/.*.toml|/themes/everforest.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/everforest.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes/.*.conf|themes/everforest.conf|' $HOME/.config/kitty/kitty.conf
        sed -i 's|themes.*"|themes.everforest"|' $HOME/.config/nvim/init.lua
        sed -i 's|/themes/.*.ini|/themes/everforest.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/everforest.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/everforest.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "everforest"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/volume.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/vpn.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/screenshoter.sh ;;

    dark)
        sed -i 's|/themes/.*.toml|/themes/nord.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/nord.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes/.*.conf|themes/nord.conf|' $HOME/.config/kitty/kitty.conf
        sed -i 's|themes.*"|themes.nord"|' $HOME/.config/nvim/init.lua
        sed -i 's|/themes/.*.ini|/themes/nord.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/nord.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/nord.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "nord"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/volume.sh
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/vpn.sh
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/screenshoter.sh ;;
esac

