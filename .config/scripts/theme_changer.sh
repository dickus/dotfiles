#!/bin/bash

light="$1"
dark="$2"

light_themes=("everforest" "gruvbox")
dark_themes=("gruvbox" "nord")

current_light="$(cat $HOME/.config/scripts/theme_schedule.sh | grep -oP '/themes/\K[^.]+(?=.toml)' | head -n 1)"
current_dark="$(cat $HOME/.config/scripts/theme_schedule.sh | grep -oP '/themes/\K[^.]+(?=.toml)' | tail -n 1)"

for theme_index in "${!light_themes[@]}"; do
    theme="${light_themes[$theme_index]}"
    if [[ "$current_light" == *"$theme"* ]]; then
        light_themes[$theme_index]="* $theme"
    fi
done

for theme_index in "${!dark_themes[@]}"; do
    theme="${dark_themes[$theme_index]}"
    if [[ "$current_dark" == *"$theme"* ]]; then
        dark_themes[$theme_index]="* $theme"
    fi
done

if [[ "$#" -ne 2 ]]; then
    echo -e "\033[1mtheme <light_theme> <dark_theme>\033[0m\n"
    printf "\033[1m%-15s %s\033[0m\n" "Light themes" "Dark themes"
    printf "%-15s %s\n" "${light_themes[0]}" "${dark_themes[0]}"
    printf "%-15s %s\n" "${light_themes[1]}" "${dark_themes[1]}"

    exit
fi

if [[ "$light" != "everforest" ]] && [[ "$light" != "gruvbox" ]] && [[ "$dark" != "gruvbox" ]] && [[ "$dark" != "nord" ]]; then
    echo "Incorrect themes input."
    echo -e "Run \033[1mtheme\033[0m with no arguments to see how to use it."

    exit
fi

if [[ "$light" != "everforest" ]] && [[ "$light" != "gruvbox" ]]; then
    echo "Incorrect light theme input."
    echo -e "Run \033[1mtheme\033[0m with no arguments to see how to use it."

    exit
fi

if [[ "$dark" != "gruvbox" ]] && [[ "$dark" != "nord" ]]; then
    echo "Incorrect dark theme input."
    echo -e "Run \033[1mtheme\033[0m with no arguments to see how to use it."

    exit
fi

case $light in
    everforest)
        sed -i 's|gruvbox-light|everforest|' $HOME/.config/scripts/theme_schedule.sh ;;

    gruvbox)
        sed -i 's|everforest|gruvbox-light|' $HOME/.config/scripts/theme_schedule.sh ;;
esac

case $dark in
    gruvbox)
        sed -i 's|nord|gruvbox-dark|' $HOME/.config/scripts/theme_schedule.sh ;;

    nord)
        sed -i 's|gruvbox-dark|nord|' $HOME/.config/scripts/theme_schedule.sh ;;
esac

echo -e "Light theme is changed to \033[1m'$light'\033[0m."
echo -e "Dark theme is changed to \033[1m'$dark'\033[0m."

