#!/usr/bin/env bash

# Define the options to display in the Rofi menu
options="🇪🇸 Spanish (ES)\n🇩🇰 Danish (DK)\n🇬🇧 English (UK)"

# Launch Rofi and capture the user's selection
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Keyboard Layout" -theme-str 'window {width: 15%;}')

# Apply the selected layout based on the choice
case "$chosen" in
    *Spanish*)
        setxkbmap -layout es,dk,gb
        ;;
    *Danish*)
        setxkbmap -layout dk,es,gb
        ;;
    *English*)
        setxkbmap -layout gb,es,dk
        ;;
esac
