#!/usr/bin/env bash

# ==============================================================================
# Dynamic Display & Touch Input Manager for i3wm (Regex ID Extraction)
# ==============================================================================

MAIN="eDP"
PORTABLE="DisplayPort-0"
WALLPAPER="/home/jesus/Desktop/wallpapers/twokfrontcover.jpg"

# Check if the portable monitor is physically connected via video link
if xrandr | grep -q "$PORTABLE connected"; then
    # 1. Force the monitor setup layout to the left side
    xrandr --output "$MAIN" --auto --primary --output "$PORTABLE" --auto --left-of "$MAIN"
    
    # 2. Give Xorg a brief moment to stabilize the new USB nodes
    sleep 1
    
    # 3. BULLETPROOF ID EXTRACTION
    # This filters the raw xinput text table, finds lines with "wch.cn TouchScreen",
    # makes sure they are pointers (not master devices), and extracts just the id=XX numbers.
    DEVICE_IDS=$(xinput list | grep "wch.cn TouchScreen" | grep -v "XBOX" | grep -o 'id=[0-9]*' | cut -d= -f2)
    
    # 4. Map each extracted raw numeric ID directly to DisplayPort-0
    for id in $DEVICE_IDS; do
        xinput map-to-output "$id" "$PORTABLE"
    done
else
    # 5. Clean Tear-Down if unplugged
    xrandr --output "$PORTABLE" --off --output "$MAIN" --auto --primary
fi

# 6. Reset independent scaling wallpaper parameters
feh --bg-fill "$WALLPAPER" "$WALLPAPER"
