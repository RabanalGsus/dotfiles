#!/bin/bash

# 1. Get the ID of the active window
ID=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5)

# If no window is active (desktop focused), exit quietly
if [ "$ID" == "0x0" ] || [ -z "$ID" ]; then
    echo ""
    exit 0
fi

# 2. Get the Class Name (for the icon) and the Title (for the text)
WM_CLASS=$(xprop -id "$ID" WM_CLASS | cut -d '"' -f 4)
WM_TITLE=$(xprop -id "$ID" _NET_WM_NAME | cut -d '"' -f 2)

# 3. Map Class Names to Icons
# You can find the Class Name by running 'xprop WM_CLASS' and clicking a window
case "$WM_CLASS" in
    "Vivaldi-stable"|"Vivaldi-bin"|"vivaldi-stable")
        ICON="󰬝" ;; # Vivaldi/Browser icon
    "firefox")
        ICON="" ;;
    "Alacritty"|"kitty"|"st-256color")
        ICON="" ;;
    "code-oss"|"code"|"Visual Studio Code")
        ICON="󰨞" ;;
    "Spotify")
        ICON="" ;;
    "vesktop")
        ICON="󰙯" ;;
    *)
        ICON="" ;; # Default icon for unknown apps
esac

# 4. Output the result
# This is what Polybar will display
echo "$ICON  $WM_TITLE"
