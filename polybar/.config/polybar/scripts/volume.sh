#!/bin/bash

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

# 1. Check if a Bluetooth device is currently driving the audio
BT_ACTIVE=$(pactl info | grep "Default Sink" | grep -i "bluez")

# 2. Check if the physical hardware card has switched its active port to headphones
WIRED_ACTIVE=$(pactl list sinks | grep -A 15 "State: RUNNING" | grep -i "Active Port" | grep -i "headphone")

if [ "$MUTE" = "true" ]; then
    echo "  %{F#BF616A}󰝟%{F-} "
else
    # Choose icon based on what is connected
    if [ -n "$BT_ACTIVE" ]; then
        ICON="   "  # Bluetooth Headphone Icon
    elif [ -n "$WIRED_ACTIVE" ]; then
        ICON="   "  # Wired Headphone Icon (Feel free to change to a different icon if you want to tell them apart)
    else
        # SPEAKER RAMPS (Your original speaker icons)
        if [ "$VOL" -lt 30 ]; then
            ICON="   "
        elif [ "$VOL" -lt 70 ]; then
            ICON="   "
        else
            ICON="   "
        fi
    fi
    # Output with your Aqua color
    echo "%{F#7fbbb3}$ICON%{F-} $VOL%"
fi
