#!/bin/bash

# 1. Change the volume (accepts +5% or -5%)
pactl set-sink-volume @DEFAULT_SINK@ $1

# 2. Tell Polybar to show Hook 1 (Icon + %)
polybar-msg action "#vol-dynamic.hook.1"

# 3. Kill any previous "wait" timers so they don't overlap
pkill -f "sleep 2 && polybar-msg action #vol-dynamic.hook.0"

# 4. Wait 2 seconds, then go back to Hook 0 (Just Icon)
(sleep 2 && polybar-msg action "#vol-dynamic.hook.0") &
