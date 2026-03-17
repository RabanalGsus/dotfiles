#!/bin/bash

# Hardcoded paths - No variables that can fail
SOUND_IN="/home/jesus/Music/plugged_in.mp3"
SOUND_OUT="/home/jesus/Music/unplugged.mp3"
AC_PATH="/sys/class/power_supply/AC/online"

# Initial state
LAST_STATE=$(cat "$AC_PATH")

while true; do
    CURRENT_STATE=$(cat "$AC_PATH")

    if [ "$CURRENT_STATE" == "1" ] && [ "$LAST_STATE" == "0" ]; then
        /usr/bin/mpg123 -q "$SOUND_IN"
        LAST_STATE="1"
    elif [ "$CURRENT_STATE" == "0" ] && [ "$LAST_STATE" == "1" ]; then
        /usr/bin/mpg123 -q "$SOUND_OUT"
        LAST_STATE="0"
    fi

    sleep 1
done
