#!/bin/bash

# Get the mute status of the default microphone
MUTE=$(pamixer --default-source --get-mute)

if [ "$MUTE" = "true" ]; then
    # Red crossed-out mic when muted
    echo "  %{F#BF616A}%{F-}"
else
    # Aqua mic when active
    # (If you want the icon to DISAPPEAR entirely when unmuted to save space, 
    # just change the line below to: echo "")
    echo "  %{F#7fbbb3}%{F-}"
fi
