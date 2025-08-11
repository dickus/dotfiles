My dotfiles for a bunch of apps.

**[[Preview](#preview)] × [[Dependencies](#dependencies)] × [[Installation](#installation)]**


## Preview
<table>
    <tr>
        <td><b>Fjord/Nord</b></br><img src="previews/preview_fjord_nord.png"></td>
        <td><b>Latte/Frappe</b><img src="previews/preview_latte_frappe.png"></td>
    </tr>
    <tr>
        <td><b>Everforest/Darkforest</b><img src="previews/preview_everforest_darkforest.png"></td>
        <td><b>Lightbox/Gruvbox</b><img src="previews/preview_lightbox_gruvbox.png"></td>
    </tr>
</table>

## Dependencies
* [bat](https://github.com/sharkdp/bat)
* [dunst](https://github.com/dunst-project/dunst)
* [exa](https://github.com/ogham/exa)
* [fastfetch](https://github.com/fastfetch-cli/fastfetch)
* [fuseiso](https://sourceforge.net/projects/fuseiso/)
* [fzf](https://github.com/junegunn/fzf)
* [grim](https://sr.ht/~emersion/grim/) + [slurp](https://github.com/emersion/slurp)
* [hyprland](https://github.com/hyprwm/Hyprland) + [hypridle](https://github.com/hyprwm/hypridle) + [hyprlock](https://github.com/hyprwm/hyprlock)
* [hyprpicker](https://github.com/hyprwm/hyprpicker)
* [hyprsunset](https://github.com/hyprwm/hyprsunset)
* `librewolf`
* `mkisofs`
* [mpv](https://github.com/mpv-player/mpv)
* [nvim](https://github.com/neovim/neovim)
* [zsh](https://github.com/ohmyzsh/ohmyzsh), [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
* `7zip`, `unzip`
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [rofi](https://github.com/davatorium/rofi)
* [sf-mono-nerd](https://github.com/epk/SF-Mono-Nerd-Font)
* [swayimg](https://github.com/artemsen/swayimg)
* [swww](https://github.com/LGFae/swww)
* [waybar](https://github.com/Alexays/Waybar)
* [wf-recorder](https://github.com/ammen99/wf-recorder)
* [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
* `xdg-desktop-portal-wlr` + `xdg-desktop-portal-hyprland` + `xdg-desktop-portal-gtk`
* [zathura](https://github.com/pwmt/zathura)
* [zoxide](https://github.com/ajeetdsouza/zoxide)

## Installation
```
git clone git@github.com:dickus/dotfiles.git .dotfiles
```

If you don't need some configs, remove them from repo after you clone it.

Then I recommend you to use [stow](https://github.com/aspiers/stow/) to manage dotfiles.
```
cd .dotfiles && stow . && cd
```
