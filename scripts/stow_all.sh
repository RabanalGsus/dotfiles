#!/usr/bin/env bash

# Color Matrix
G='\033[0;32m' # Success Green
R='\033[0;31m' # Critical Red
C='\033[0;36m' # System Cyan
NC='\033[0m'   # Override/Reset

# --- THE STACK ---
APPS=(i3 polybar rofi picom kitty zsh feh stow curl unzip code)
DOTFILES_DIR="$HOME/dotfiles"

clear
echo -e "${C}████████████████████████████████████████████████████████████"
echo "  > UPLINK ESTABLISHED. TERMINAL ACTIVE."
echo "  > BOOTSTRAPPING USER ENVIRONMENT REPLICATION..."
echo -e "████████████████████████████████████████████████████████████${NC}"
sleep 0.8

# --- 1. HOST ANALYSIS ---
echo -ne "  ${C}[SYS]${NC} Scanning host substrate topology... "
sleep 0.5
if command -v pacman &> /dev/null; then
    INSTALLER="sudo pacman -S"
    OS="${C}ARCH_NEXUS${NC}"
elif command -v apt &> /dev/null; then
    INSTALLER="sudo apt update && sudo apt install -y"
    OS="${C}DEBIAN_CORE${NC}"
elif command -v dnf &> /dev/null; then
    INSTALLER="sudo dnf install -y"
    OS="${C}FEDORA_GRID${NC}"
else
    INSTALLER="echo 'CRITICAL: Fabricator unavailable. Manual sequence required:'"
    OS="${R}UNKNOWN_ANOMALY${NC}"
fi
echo -e "$OS"
echo ""
sleep 0.4

# --- 2. DEPENDENCY AUDIT ---
echo -e "  ${C}[SYS]${NC} Pinging localized interface modules:"
MISSING_APPS=()
for app in "${APPS[@]}"; do
    sleep 0.1 
    if ! command -v "$app" &> /dev/null; then
        echo -e "      > $app ........................... ${R}[ OFFLINE ]${NC}"
        MISSING_APPS+=("$app")
    else
        echo -e "      > $app ........................... ${G}[  ACTIVE  ]${NC}"
    fi
done

# --- 3. AUTO-FABRICATION ---
if [ ${#MISSING_APPS[@]} -ne 0 ]; then
    echo ""
    echo -e "  ${R}[WARN] Subsystem fragmentation detected. Missing dependencies:${NC}"
    echo -e "         [ ${MISSING_APPS[*]} ]"
    echo ""
    echo -ne "  ${C}[REQ]${NC} Authorize automated fabricator deployment? (y/n): "
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "  ${C}[SYS]${NC} Routing power to package manager..."
        sleep 0.5
        eval $INSTALLER "${MISSING_APPS[@]}"
    else
        echo -e "  ${R}[WARN] Override confirmed. Proceeding with degraded integrity.${NC}"
    fi
fi

# --- 4. THE SYNC (STOW) ---
echo ""
echo -e "  ${C}[SYS] Engaging molecular symlink protocol (STOW)...${NC}"
cd "$DOTFILES_DIR"

if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo -e "  ${C}[SYS]${NC} Purging static shell config (.zshrc -> .zshrc.bak)"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo -ne "  ${C}[SYS]${NC} Entangling local directories... "
stow i3 kitty misc picom polybar rofi zsh fonts
sleep 0.8
echo -e "${G}SUCCESS.${NC}"

# --- 5. ASSET DEPLOYMENT (TYPOGRAPHY SUITE) ---
if [ -f "./scripts/install_fonts.sh" ]; then
    echo -e "\n  ${C}[SYS] Decoding optical data-glyphs (Typography Suite)...${NC}"
    chmod +x ./scripts/install_fonts.sh
    
    # Handover to sub-process HUD
    ./scripts/install_fonts.sh
    
    if [ $? -eq 0 ]; then
        echo -e "  ${G}[✔] Typography Suite integrated successfully.${NC}"
    else
        echo -e "  ${R}[✘] WARNING: Typography Suite deployment encountered anomalies.${NC}"
    fi
else
    echo -e "  ${R}[✘] CRITICAL: Acquisition module './scripts/install_fonts.sh' not found.${NC}"
fi

echo ""
sleep 0.5
echo -e "${G}████████████████████████████████████████████████████████████"
echo "  > REPLICATION 100% COMPLETE."
echo "  > ALL SECTORS NOMINAL. WELCOME TO THE GRID, OPERATOR."
echo -e "████████████████████████████████████████████████████████████${NC}"
