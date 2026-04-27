#!/usr/bin/env bash

# --- THE STACK ---
APPS=(i3 polybar rofi picom kitty zsh feh stow curl unzip)
DOTFILES_DIR="$HOME/dotfiles"

clear
echo "████████████████████████████████████████████████████████████"
echo "  > UPLINK ESTABLISHED. TERMINAL ACTIVE."
echo "  > BOOTSTRAPPING USER ENVIRONMENT REPLICATION..."
echo "████████████████████████████████████████████████████████████"
sleep 0.8

# --- 1. HOST ANALYSIS ---
echo -n "  [SYS] Scanning host substrate topology... "
sleep 0.5
if command -v pacman &> /dev/null; then
    INSTALLER="sudo pacman -S"
    OS="ARCH_NEXUS"
elif command -v apt &> /dev/null; then
    INSTALLER="sudo apt update && sudo apt install -y"
    OS="DEBIAN_CORE"
elif command -v dnf &> /dev/null; then
    INSTALLER="sudo dnf install -y"
    OS="FEDORA_GRID"
else
    INSTALLER="echo 'CRITICAL: Fabricator unavailable. Manual sequence required:'"
    OS="UNKNOWN_ANOMALY"
fi
echo "$OS"
echo ""
sleep 0.4

# --- 2. DEPENDENCY AUDIT ---
echo "  [SYS] Pinging localized interface modules:"
MISSING_APPS=()
for app in "${APPS[@]}"; do
    # The sleep here creates a cool "scanning" effect in the terminal
    sleep 0.1 
    if ! command -v "$app" &> /dev/null; then
        echo "      > $app ........................... [ OFFLINE ]"
        MISSING_APPS+=("$app")
    else
        echo "      > $app ........................... [ ACTIVE ]"
    fi
done

# --- 3. AUTO-FABRICATION ---
if [ ${#MISSING_APPS[@]} -ne 0 ]; then
    echo ""
    echo "  [WARN] Subsystem fragmentation detected. Missing dependencies:"
    echo "         [ ${MISSING_APPS[*]} ]"
    echo ""
    read -p "  [REQ] Authorize automated fabricator deployment? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "  [SYS] Routing power to package manager..."
        sleep 0.5
        eval $INSTALLER "${MISSING_APPS[@]}"
    else
        echo "  [WARN] Override confirmed. Proceeding with degraded integrity."
    fi
fi

# --- 4. THE SYNC (STOW) ---
echo ""
echo "  [SYS] Engaging molecular symlink protocol (STOW)..."
cd "$DOTFILES_DIR"

# Handle existing config blockage
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "  [SYS] Purging static shell config (.zshrc -> .zshrc.bak)"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo -n "  [SYS] Entangling local directories... "
stow i3 kitty misc picom polybar rofi zsh fonts
sleep 0.8
echo "SUCCESS."

# --- 5. ASSET DEPLOYMENT ---
if [ -f "./scripts/install_fonts.sh" ]; then
    echo "  [SYS] Decoding optical data-glyphs (Typography Suite)..."
    chmod +x ./scripts/install_fonts.sh
    ./scripts/install_fonts.sh > /dev/null
fi

echo ""
sleep 0.5
echo "████████████████████████████████████████████████████████████"
echo "  > REPLICATION 100% COMPLETE."
echo "  > ALL SECTORS NOMINAL. WELCOME TO THE GRID, OPERATOR."
echo "████████████████████████████████████████████████████████████"
