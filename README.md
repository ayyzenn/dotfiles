# 🌿 Saad's Arch Linux i3 Dotfiles

This repository contains my personal configuration files for a minimal, beautiful, and functional Arch Linux system using the i3 window manager.

All configs are organized inside `~/dotfiles/config/` and symlinked to `~/.config/`.

---

## 📦 Tracked Configs

This repo includes configs for:

- `i3` – tiling window manager
- `i3blocks` – status bar blocks
- `picom` – compositor (for transparency, shadows, etc.)
- `dunst` – lightweight notification daemon
- `wezterm` – GPU-accelerated terminal emulator
- `ranger` – terminal file manager
- `nitrogen` – wallpaper setter
- `gtk-2.0` / `gtk-3.0` – GTK themes
- `bat` – `cat` clone with syntax highlighting

---

## 🚀 Installation

> For fresh setup or after reinstalling Arch

```bash
git clone https://github.com/ayyzenn/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh

