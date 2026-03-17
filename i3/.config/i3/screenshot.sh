#!/bin/bash
FILE=~/Pictures/screenshot_$(date +%F_%T).png

# Added -u to bypass the blur/compositor smudging
# Added -b 3 to give you a clean 3px border while selecting
if maim -u -s -b 3 "$FILE"; then
    xclip -selection clipboard -t image/png -i "$FILE"
    notify-send "Screenshot Captured" "Saved to ~/Pictures and copied to clipboard" -i camera-photo
else
    notify-send "Screenshot Cancelled" "No area was selected." -u low
fi
