#!/bin/bash

# 1. Get the mute status
MUTE=$(pamixer --default-source --get-mute)

# 2. Check if any app is currently using the mic
IN_USE=$(pactl list source-outputs | grep "Source Output #" | wc -l)

if [ "$MUTE" = "true" ]; then
    # Your Red color and double-space padding
    echo "  %{F#BF616A}%{F-}"
elif [ "$IN_USE" -gt 0 ]; then
    # Green (matching your battery/active state) when an app is recording
    echo "  %{F#8cfc03}%{F-}"
else
    # Your Aqua color for when the mic is On but Idle
    echo "  %{F#7fbbb3}%{F-}"
fi