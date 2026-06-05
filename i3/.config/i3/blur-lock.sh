#!/bin/bash

# Clear any previous lock instances
killall i3lock

# Run i3lock with modern, clean styling
i3lock \
  --blur 5 \
  --clock \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%A, %Y-%m-%d" \
  --insidever-color=00000000 \
  --insidewrong-color=00000000 \
  --inside-color=00000000 \
  --ringver-color=b4befe \
  --ringwrong-color=f38ba8 \
  --ring-color=6c7086 \
  --line-color=00000000 \
  --keyhl-color=a6e3a1 \
  --bshl-color=f38ba8 \
  --text-color=cdd6f4 \
  --time-color=cdd6f4 \
  --date-color=bac2de \
  --verif-text="Verifying..." \
  --wrong-text="Wrong Password" \
  --noinput-text="Empty"
