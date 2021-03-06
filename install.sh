#!/usr/bin/env bash

prog="$(basename $0 .sh)"
[ "$(basename $(pwd))" != "dotfiles" ] && echo "$prog: must be run in dotfiles repo root"

[ ! -e "$HOME/.config" ] && mkdir "$HOME/.config"

mklink () {
    echo "$prog: processing '$1'"
	if [ -e "$HOME/.config/$1" ] && [ ! -L "$HOME/.config/$1" ]; then
        echo "$prog: backup '$HOME/.config/$1'"
		mv "$HOME/.config/$1" "$HOME/.config/$1.bak"
	fi

    if [ ! -e "$(dirname $HOME/.config/$1)" ]; then
        mkdir -p "$(dirname $HOME/.config/$1)"
    fi

	if [ ! -e "$HOME/.config/$1" ]; then
        echo "$prog: configure '$1'"
		ln -s "$(pwd)/.config/$1" "$HOME/.config/$1"
	fi
}

mksource () {
    echo "$prog: processing '$1'"
    src="$(pwd)/$1"
    dest="$HOME/${2:-$1}"
    if ! grep -q "$src" "$dest"; then
        echo "[ -e \"$src\" ] && . \"$src\"" >> "$dest"
    fi
}

# albert
mklink albert

# bug.n

# bspwm
mklink bspwm

# sxhkd
mklink sxhkd

# conky
mklink conky

# theme
mklink colors.sh

# dunst
mklink dunst

# i3
mklink i3

# i3blocks
mklink i3blocks

# i3status
mklink i3status

# kitty
mklink kitty

# Microsoft.WindowsTerminal

# mpd
mklink mpd

# nano - eh why not
mklink nano

# neofetch
mklink neofetch

# newsboat
mklink newsboat

# nvim
mklink nvim

# rofi
mklink rofi

# sxiv
mklink sxiv

# tmux
mklink tmux
ln -sf "$HOME/.config/tmux/.tmux.conf" "$HOME/.tmux.conf"

# VSCodium
mkdir -p "$HOME/.config/VSCodium/User/"
mklink "VSCodium/User/settings.json"
mklink "VSCodium/User/keybindings.json"

# wal
mklink wal

# xfce4
mklink xfce4

# compton
mklink compton
mklink picom

# ranger
mklink ranger

# zsh
mklink zsh
ln -sf "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

# zathura
mklink zathura

# .Xmodmap
ln -sf "$(pwd)/.Xmodmap" "$HOME/.Xmodmap"

# .profile
mksource .profile

# .zprofile
mksource .zprofile

# .xprofile
mksource .xprofile

# .bashrc
mksource .bashrc

# shell rc
mklink rc

# .ideavimrc
ln -sf "$(pwd)/.config/ideavimrc" "$HOME/.ideavimrc"

# Xresources
mklink Xresources

