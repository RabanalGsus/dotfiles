#!/usr/bin/env bash

# Options to display
options=" Power Saver\n󰾆 Balanced\n󰓅 Performance"

# Launch Rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Profile" -theme-str 'window {width: 250px;}')

# Apply the profile
case $chosen in
    *Saver) powerprofilesctl set power-saver ;;
    *Balanced) powerprofilesctl set balanced ;;
    *Performance) powerprofilesctl set performance ;;
esac
