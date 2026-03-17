# 🐧 The Clean EliteBook Dotfiles

This repository contains my first personal Rice for a productivity-focused Linux setup. It is optimized for an HP EliteBook but works on most high-resolution laptops.

## 🖼️ Preview
> [!TIP]
> This setup uses a "Dark Mode" aesthetic with high-contrast lime green accents for system status.

---

## 🛠️ Core Dependencies

To get this look on a fresh install, you need to install the following packages:

### 1. The Basics (Window Manager & Terminal)
* **i3-wm** (or `i3-gaps`)
* **polybar** (Status bar)
* **kitty** (The terminal)
* **rofi** (Application launcher)
* **picom** (For transparency/shadows)

### 2. The Secret Sauce (Fonts & Icons)
The bar and scripts will look like broken squares without these:
* **JetBrainsMono Nerd Font** (The primary font)
* **Font Awesome 6** (Optional, for extra glyphs)

### 3. Shell & Utilities
* **zsh** + **Oh My Zsh**
* **stow** (For managing these dotfiles)
* **bc** & **acpi** (Required for the battery scripts)

---

## 🚀 Quick Install

Follow these steps to replicate the setup on a fresh machine:

### Step 1: Clone the Repo
```bash
cd ~
git clone [https://github.com/RabanalGsus/dotfiles.git](https://github.com/RabanalGsus/dotfiles.git)
cd dotfiles
```

### Step 2: Ubuntu/Debian
```bash
sudo apt update && sudo apt install stow -y

# Arch
sudo pacman -S stow
```
### Step 3: Symlink the configs
#### Inside the dotfiles directory
```bash
stow -v i3
stow -v polybar
stow -v kitty
stow -v zsh
```
### Step 4: Fix permissions
```bash
chmod +x ~/.config/polybar/scripts/*.sh
chmod +x ~/.config/i3/*.sh
```
### Step 5: check i3 config file for keybinds

#### Battery Script notes: This script is tuned for ```/sys/class/power_supply/```BAT0. If your hardware uses BAT1, update the path in ```~/.config/polybar/scripts/battery_status.sh```.