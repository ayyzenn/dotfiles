#!/bin/bash

DOTDIR=~/dotfiles/config

echo "Installing dotfiles..."

# Create backup
BACKUP_DIR=~/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR

# Backup existing files
[[ -f ~/.bashrc ]] && cp ~/.bashrc $BACKUP_DIR/
[[ -f ~/.vimrc ]] && cp ~/.vimrc $BACKUP_DIR/

echo "✅ Backup created at: $BACKUP_DIR"

# Shell configurations
[[ -e ~/.bashrc ]] && rm -f ~/.bashrc
ln -sf $DOTDIR/.bashrc ~/.bashrc
echo "✅ Linked .bashrc"

# Vim configurations
[[ -e ~/.vimrc ]] && rm -f ~/.vimrc
ln -sf $DOTDIR/.vimrc ~/.vimrc
echo "✅ Linked vim configs"

# Desktop environment configurations
[[ -e ~/.config/i3 ]] && rm -rf ~/.config/i3
[[ -e ~/.config/picom ]] && rm -rf ~/.config/picom
[[ -e ~/.config/wezterm ]] && rm -rf ~/.config/wezterm
[[ -e ~/.config/dunst ]] && rm -rf ~/.config/dunst
[[ -e ~/.config/nitrogen ]] && rm -rf ~/.config/nitrogen
[[ -e ~/.config/gtk-2.0 ]] && rm -rf ~/.config/gtk-2.0
[[ -e ~/.config/gtk-3.0 ]] && rm -rf ~/.config/gtk-3.0
[[ -e ~/.config/ranger ]] && rm -rf ~/.config/ranger
[[ -e ~/.config/i3blocks ]] && rm -rf ~/.config/i3blocks
[[ -e ~/.config/bat ]] && rm -rf ~/.config/bat
[[ -e ~/.config/alacritty ]] && rm -rf ~/.config/alacritty
[[ -e ~/.config/fastfetch ]] && rm -rf ~/.config/fastfetch

ln -sf $DOTDIR/i3 ~/.config/i3
ln -sf $DOTDIR/picom ~/.config/picom
ln -sf $DOTDIR/wezterm ~/.config/wezterm
ln -sf $DOTDIR/dunst ~/.config/dunst
ln -sf $DOTDIR/nitrogen ~/.config/nitrogen
ln -sf $DOTDIR/gtk-2.0 ~/.config/gtk-2.0
ln -sf $DOTDIR/gtk-3.0 ~/.config/gtk-3.0
ln -sf $DOTDIR/ranger ~/.config/ranger
ln -sf $DOTDIR/i3blocks ~/.config/i3blocks
ln -sf $DOTDIR/bat ~/.config/bat
ln -sf $DOTDIR/alacritty ~/.config/alacritty
ln -sf $DOTDIR/fastfetch ~/.config/fastfetch

echo "✅ All configs linked successfully!"

# Install vim plugins
if command -v vim >/dev/null 2>&1; then
    echo "Installing vim plugins..."
    vim +PlugInstall +qall 2>/dev/null
    echo "✅ Vim plugins installed"
fi

echo "Done! Run 'source ~/.bashrc' to apply changes."

