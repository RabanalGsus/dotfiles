#!/bin/bash

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)
HP=$(pactl list sinks | grep -i "Active Port" | grep -i "headphone")

if [ "$MUTE" = "true" ]; then
    echo "%{F#FF0000}󰝟%{F-} Muted"
else
    # Check if we are using Headphones or Speakers
    if [ -n "$HP" ]; then
        ICON=" "
    else
        # SPEAKER RAMPS (Your original icons)
        if [ "$VOL" -lt 30 ]; then
            ICON=" "
        elif [ "$VOL" -lt 70 ]; then
            ICON=" "
        else
            ICON=" "
        fi
    fi
    # Output with your Aqua color
    echo "%{F#7fbbb3}$ICON%{F-} $VOL%"
fi
