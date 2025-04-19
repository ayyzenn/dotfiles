#!/bin/bash

DOTDIR=~/dotfiles/config

ln -sf $DOTDIR/dunst ~/.config/dunst
ln -sf $DOTDIR/gtk-2.0 ~/.config/gtk-2.0
ln -sf $DOTDIR/gtk-3.0 ~/.config/gtk-3.0
ln -sf $DOTDIR/i3 ~/.config/i3
ln -sf $DOTDIR/i3blocks ~/.config/i3blocks
ln -sf $DOTDIR/nitrogen ~/.config/nitrogen
ln -sf $DOTDIR/picom ~/.config/picom
ln -sf $DOTDIR/ranger ~/.config/ranger
ln -sf $DOTDIR/wezterm ~/.config/wezterm
ln -sf $DOTDIR/bat ~/.config/bat

