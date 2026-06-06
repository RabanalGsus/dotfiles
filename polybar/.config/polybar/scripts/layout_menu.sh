#!/usr/bin/env bash

# 1. Handle the Alt+Shift cycling
if [ "$1" = "cycle" ]; then
    # Grab the layout string (e.g., "es,dk,gb")
    FULL_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')
    
    # Extract only the first layout before the comma (e.g., "es")
    CURRENT="${FULL_LAYOUT%%,*}"
    
    case "$CURRENT" in
        es) setxkbmap -layout dk,gb,es ;;
        dk) setxkbmap -layout gb,es,dk ;;
        *)  setxkbmap -layout es,dk,gb ;;
    esac
    exit 0
fi

# 2. Handle the Polybar click Rofi menu
options="🇪🇸 Spanish (ES)\n🇩🇰 Danish (DK)\n🇬🇧 English (UK)"
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Keyboard Layout")

case "$chosen" in
    *Spanish*) setxkbmap -layout es,dk,gb ;;
    *Danish*)  setxkbmap -layout dk,es,gb ;;
    *English*) setxkbmap -layout gb,es,dk ;;
esac
