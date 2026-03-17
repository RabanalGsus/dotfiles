#!/bin/bash

# Define the options
options=" Shutdown\n󰽥 Suspend\n Reboot\n Lock\n Logout"

# Get user selection via rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -theme-str 'window {width: 15%;}')

# Execute based on choice
case "$chosen" in
    *Shutdown) systemctl poweroff ;;
    *Suspend) ~/.config/i3/blur-lock.sh && systemctl suspend ;;
    *Reboot) systemctl reboot ;;
    *Lock) ~/.config/i3/blur-lock.sh ;; # Or your preferred locker
    *Logout) i3-msg exit ;;
esac
