#!/usr/bin/env bash

# Kill any existing Polybar instances
killall -q polybar

# Wait until they are shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch Polybar
polybar main &
