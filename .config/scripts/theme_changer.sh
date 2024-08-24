#!/bin/zsh

theme="$1"

case $theme in
    everforest)
        sed -i 's|/themes/.*.toml|/themes/everforest.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/everforest.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes.*"|themes.everforest"|' $HOME/.config/nvim/init.lua
        sed -i 's|themes.*"|themes.everforest"|' $HOME/.config/nvim/text_nvim.lua
        sed -i 's|/themes/.*.ini|/themes/everforest.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/everforest.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/everforest.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "everforest"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/volume.sh
        sed -i 's|bat --theme .*"|bat --theme gruvbox-light"|' $HOME/.zshrc ;;

    gruvbox)
        sed -i 's|/themes/.*.toml|/themes/gruvbox.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/gruvbox.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes.*"|themes.gruvbox"|' $HOME/.config/nvim/init.lua
        sed -i 's|themes.*"|themes.gruvbox"|' $HOME/.config/nvim/text_nvim.lua
        sed -i 's|/themes/.*.ini|/themes/gruvbox.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/gruvbox.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/gruvbox.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "gruvbox"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/dark/|/light/|' $HOME/.config/scripts/volume.sh
        sed -i 's|bat --theme .*"|bat --theme gruvbox-light"|' $HOME/.zshrc ;;

    nord)
        sed -i 's|/themes/.*.toml|/themes/nord.toml|' $HOME/.config/alacritty/alacritty.toml
        sed -i 's|/themes/.*.sh|/themes/nord.sh|' $HOME/.config/bspwm/bspwmrc
        sed -i 's|themes.*"|themes.nord"|' $HOME/.config/nvim/init.lua
        sed -i 's|themes.*"|themes.nord"|' $HOME/.config/nvim/text_nvim.lua
        sed -i 's|/themes/.*.ini|/themes/nord.ini|' $HOME/.config/polybar/config.ini
        sed -i 's|/themes/.*.rasi|/themes/nord.rasi|' $HOME/.config/rofi/config.rasi
        sed -i 's|/themes/.*.rasi|/themes/nord.rasi|' $HOME/.config/rofi/powermenu.rasi
        sed -i 's|theme ".*"|theme "nord"|' $HOME/.config/zellij/config.kdl
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/microphone.sh
        sed -i 's|/light/|/dark/|' $HOME/.config/scripts/volume.sh
        sed -i 's|bat --theme .*"|bat --theme gruvbox-dark"|' $HOME/.zshrc ;;

    *)
        echo "everforest"
        echo "gruvbox"
        echo "nord" ;;
esac

bspc wm -r
source .zshrc

