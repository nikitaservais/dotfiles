#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

# Vim conf
if ask "Do you want to install .vimrc?"; then
    ln -s "$(realpath ".vimrc")" ~/.vimrc
fi

# Helix conf
if ask "Do you want to install Helix config?"; then
    mkdir -p ~/.config/helix
    ln -s "$(realpath "helix/config.toml")" ~/.config/helix/config.toml
    ln -s "$(realpath "helix/languages.toml")" ~/.config/helix/languages.toml
fi

# Fish conf
if ask "Do you want to install Fish config?"; then
    mkdir -p ~/.config/fish
    ln -s "$(realpath "fish/config.fish")" ~/.config/fish/config.fish
fi

# Alacritty conf
if ask "Do you want to install Alacritty config?"; then
    mkdir -p ~/.config/alacritty
    ln -s "$(realpath "alacritty/alacritty.toml")" ~/.config/alacritty/alacritty.toml
fi
