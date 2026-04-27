# ⚡ THE GRID | DOTFILES

> **REPLICATION PROTOCOL:** ACTIVE  
> **OPERATOR:** JESUS  
> **SUBSTRATE:** UBUNTU / I3-GAPS

This repository contains the neural maps for my workstation environment. It is designed for rapid deployment and total system restoration via the **Tether Protocol**.

---

## 🛰️ System Anatomy
* **Window Manager:** i3-gaps (The Framework)
* **Shell:** ZSH + Oh-My-Zsh (The Interface)
* **Terminal:** Kitty (The Uplink)
* **Launchers:** Rofi + Polybar (The HUD)
* **Compositor:** Picom (The Optics)

---

## 🛠️ Restoration Sequence

To replicate this environment on a fresh node, establish a local link and execute the master deployment script:

```bash
# 1. Clone the repository
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles

# 2. Enter the directory
cd ~/dotfiles

# 3. Initialize the Grid Replication Protocol
chmod +x scripts/stow_all.sh
./scripts/stow_all.sh