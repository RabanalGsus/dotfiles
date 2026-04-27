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
    "SauceCodePro"
    "UbuntuMono"
    "FontAwesome"
    "NerdFontsSymbolsOnly"
)

# 2. Custom Fonts (Need manual links or local backup)
# Add URLs here if you find direct download links for these:
# SHINJI BLUES, Togalite, Material Icons
# ==============================================================================

VERSION="v3.1.1"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "🚀 Starting installation of your Slick Font Collection..."

# Install Nerd Fonts
for font in "${NERD_FONTS[@]}"; do
    echo "📦 Downloading Nerd Font: $font..."
    zip_file="${font}.zip"
    curl -fLo "$zip_file" "https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/${zip_file}"
    
    if [ $? -eq 0 ]; then
        unzip -o "$zip_file" -d "$FONT_DIR"
        rm "$zip_file"
        echo "✅ Installed $font"
    else
        echo "❌ Failed to download $font"
    fi
done

# Check for Manual Fonts
echo "🔍 Checking for custom aesthetic fonts..."
CUSTOM_FONTS=("SHINJI BLUES" "Togalite" "Material Icons")
for f in "${CUSTOM_FONTS[@]}"; do
    if fc-list | grep -i "$f" >/dev/null; then
        echo "✅ $f is already installed."
    else
        echo "⚠️  $f not found! Note: You'll need to manually download this one."
    fi
done

# Refresh cache
echo "🔄 Refreshing font cache..."
fc-cache -fv

echo "✨ Done! Your system is now typographically superior."
