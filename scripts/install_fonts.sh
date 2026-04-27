#!/usr/bin/env bash 

# ==============================================================================
# SLICK FONT INSTALLER
# ==============================================================================
# This script handles your specific font setup: FiraCode, SauceCodePro, 
# UbuntuMono, and your custom aesthetic fonts.
#
# RUN: chmod +x install_fonts.sh && ./install_fonts.sh
# ==============================================================================

# 1. Nerd Font Releases (Automated)
NERD_FONTS=(
    "JetBrainsMono"
    "RobotoMono"
    "FiraCode"
    "SourceCodePro"
    "UbuntuMono"
    "NerdFontsSymbolsOnly"
)

# 2. Custom Fonts (Need manual links or local backup)
# Add URLs here if you find direct download links for these:
# SHINJI BLUES, Togalite, Material Icons
# ==============================================================================

# --- SYSTEM OPTICS INITIALIZATION ---
VERSION="v3.1.1"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Color Matrix
G='\033[0;32m' # Success Green
R='\033[0;31m' # Critical Red
C='\033[0;36m' # System Cyan
NC='\033[0m'   # Override/Reset

echo -e "${C}[SYS] Initiating Typographic Acquisition Protocol v$VERSION...${NC}"
echo -e "${C}[SYS] Targeting local repository: $FONT_DIR${NC}\n"

# --- NERD FONT SIPHONING ---
for font in "${NERD_FONTS[@]}"; do
    echo -e "📡 [SYS] Siphoning Nerd Font Data-Glyphs: ${C}$font${NC}"
    zip_file="${font}.zip"
    
    # 2>/dev/null silences the raw curl error message
    if curl -# -fL "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$zip_file" -o "$zip_file" 2>/dev/null; then
        unzip -qo "$zip_file" -d "$FONT_DIR"
        rm "$zip_file"
        echo -e "   ${G}[✔]${NC} $font integration complete."
    else
        # CUSTOM SCIFI ERROR MESSAGE
        echo -e "   ${R}[✘] UPLINK SEVERED: Sector 404 detected. Data-glyph '$font' is a ghost.${NC}"
    fi
    echo ""
done

# --- SCANNING THE TYPOGRAPHIC MATRIX ---
echo -e "${C}🔍 [SYS] Scanning local sectors for custom aesthetic fonts...${NC}"
CUSTOM_FONTS=("SHINJI BLUES" "Togalite" "Material Icons")

for f in "${CUSTOM_FONTS[@]}"; do
    if fc-list | grep -i "$f" >/dev/null; then
        echo -e "   ${G}[✔]${NC} $f signature detected in system matrix."
    else
        echo -e "   ${R}[!] WARNING: Asset '$f' missing from local storage. Manual extraction required.${NC}"
    fi
done

# --- FINAL INTEGRATION ---
echo -e "\n${C}🔄 [SYS] Refreshing global font cache...${NC}"
fc-cache -fv > /dev/null

echo -e "\n${G}✨ [COMPLETED]${NC} Your system optics are now typographically superior."
