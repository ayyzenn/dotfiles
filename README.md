# 🌿 Saad's Arch Linux i3 Dotfiles

This repository contains my personal configuration files for a minimal, beautiful, and functional Arch Linux system using the i3 window manager.

All configs are organized inside `~/dotfiles/config/` and symlinked to their appropriate locations.

---

## 📦 Tracked Configs

### Shell & Editor
- `.bashrc` – bash shell configuration and aliases
- `.vimrc` – vim configuration with plugins (plugins auto-install on first run)

### Desktop Environment
- `i3` – tiling window manager
- `i3blocks` – status bar blocks
- `picom` – compositor (for transparency, shadows, etc.)
- `dunst` – lightweight notification daemon

### Terminals & Applications
- `wezterm` – GPU-accelerated terminal emulator
- `alacritty` – GPU-accelerated terminal emulator (alternative to wezterm)
- `ranger` – terminal file manager
- `bat` – `cat` clone with syntax highlighting

### Appearance & Themes
- `nitrogen` – wallpaper setter
- `gtk-2.0` / `gtk-3.0` – GTK themes

---

## 🚀 Installation

> For fresh setup or after reinstalling Arch

```bash
git clone https://github.com/ayyzenn/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script will:
- ✅ Create backup of existing configs
- ✅ Link all dotfiles configurations
- ✅ Auto-install vim plugins on first run

---

## 📝 Notes

- **Vim plugins**: Not tracked in repo, auto-downloaded fresh on each setup
- **Automatic backup**: Script creates timestamped backup before installation
- **Safe to re-run**: Script handles existing files gracefully

