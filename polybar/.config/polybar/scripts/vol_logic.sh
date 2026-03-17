#!/bin/bash

# Get Volume and Mute status
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -Po 'yes|no')

# Define your colors (Match these to your config.ini)
FG_AQUA="%{F#8be9fd}"  # Your Aqua color
BG_GHOST="%{F#282a36}" # Your Background color (makes waves 'invisible')
END_COLOR="%{F-}"

# Logic: Use the same icon for everything to keep the ratio identical
if [ "$MUTE" = "yes" ]; then
    ICON="  󰝟" # Muted is usually unique
elif [ "$VOL" -lt 33 ]; then
    # Show Speaker, hide all waves
    ICON="  󰕿"
elif [ "$VOL" -lt 66 ]; then
    # Show Medium icon
    ICON="  󰖀"
else
    # Show Loud icon
    ICON="  󰕾"
fi

echo " $ICON $VOL%"
