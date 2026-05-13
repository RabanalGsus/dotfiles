#!/bin/bash

# 1. Get the mute status
MUTE=$(pamixer --default-source --get-mute)

# 2. Check if any app is currently using the mic
IN_USE=$(pactl list source-outputs | grep "Source Output #" | wc -l)

# We use %{T3} to call the smaller font, and %{T-} to reset it
if [ "$MUTE" = "true" ]; then
    echo "  %{F#BF616A}%{T5}%{T-}%{F-}"
elif [ "$IN_USE" -gt 0 ]; then
    echo "  %{F#8cfc03}%{T5}%{T-}%{F-}"
else
    echo "  %{F#7fbbb3}%{T5}%{T-}%{F-}"
fi
