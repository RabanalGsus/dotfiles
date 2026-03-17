#!/usr/bin/env bash

# Path to battery files
BAT_PATH="/sys/class/power_supply/BAT0"
CAPACITY=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status")

# FOR TESTING ONLY --- COMMENT THIS AFTER
# CAPACITY=50  # Change this number to 10, 35, 55, 90 to see different colors
# STATUS="Charging" # Change to "Charging" to see the bolt and animation

# Icons
CHARGING_ICONS=("" "" "" "" "" "󱐋")
RED="#ff5555"
ORANGE="#ffb86c"
YELLOW="#f1fa8c"
GREEN="#8cfc03"

# --- 1. FULL STATE ---
if [ "$CAPACITY" -ge 98 ]; then
    if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
        # Keeps the bolt visible when plugged in at 100%
        echo "%{F$GREEN} 100%%{F-}"
    else
        # Just the icon if you're at 100% but unplugged
        echo "%{F$GREEN} 100%%{F-}"
    fi
    exit 0
fi

# --- 2. CHARGING ANIMATION ---
if [ "$STATUS" = "Charging" ]; then
    # The battery icons to cycle through
    CHARGING_ICONS=("" "" "" "" "")
    
    FRAME_FILE="/tmp/polybar_batt_frame"
    [ ! -f "$FRAME_FILE" ] && echo 0 > "$FRAME_FILE"
    
    FRAME=$(cat "$FRAME_FILE")
    NEXT_FRAME=$(( (FRAME + 1) % 5 ))
    echo "$NEXT_FRAME" > "$FRAME_FILE"
    
    ICON=${CHARGING_ICONS[$FRAME]}
    
    # Output: Bolt + Cycling Icon + Percentage (All synced in Green)
    echo "%{F$GREEN}$ICON $CAPACITY%%{F-}"
    exit 0
fi

# --- 3. DISCHARGING COLORS ---
if [ "$CAPACITY" -le 20 ]; then
    ICON=""
    COLOR=$RED
elif [ "$CAPACITY" -le 40 ]; then
    ICON=""
    COLOR=$ORANGE
elif [ "$CAPACITY" -le 60 ]; then
    ICON=""
    COLOR=$YELLOW
elif [ "$CAPACITY" -le 80 ]; then
    ICON=""
    COLOR=$GREEN
else
    ICON=""
    COLOR=$GREEN
fi

echo "%{F$COLOR}$ICON $CAPACITY%%{F-}"
