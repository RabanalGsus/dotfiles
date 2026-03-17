#!/usr/bin/env bash

# Get the current active profile
PROFILE=$(powerprofilesctl get)

# Assign icons/colors based on profile
if [ "$PROFILE" = "performance" ]; then
    echo "  %{F#ff5555}󰓅%{F-}"   # Red Flame/Speedo
elif [ "$PROFILE" = "power-saver" ]; then
    echo "  %{F#50fa7b}%{F-}"   # Green Leaf
else
    echo "  %{F#8be9fd}󰾆%{F-}"    # Cyan Balanced
fi
