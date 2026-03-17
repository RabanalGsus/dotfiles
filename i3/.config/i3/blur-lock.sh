#!/bin/bash

# Matching your Aqua/Black/Yellow theme
# Using #RRGGBBAA format (last two digits are transparency)
BLANK='#00000000'
CLEAR='#ffffff22'
AQUA='#8be9fdcc'
YELLOW='#f1fa8cbb'
RED='#ff5555bb'

# Use the 'i3lock' command (which is your i3lock-color binary)
i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$YELLOW      \
--insidewrong-color=$CLEAR   \
--ringwrong-color=$RED       \
--inside-color=$BLANK        \
--ring-color=$AQUA           \
--line-color=$BLANK          \
--separator-color=$AQUA      \
--verif-color=$AQUA          \
--wrong-color=$AQUA          \
--time-color=$AQUA           \
--date-color=$AQUA           \
--layout-color=$AQUA         \
--keyhl-color=$YELLOW        \
--bshl-color=$YELLOW         \
--screen=1                   \
--blur=7                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %m %Y"       \
--verif-text="Checking Face..." \
--wrong-text="Try Again" \
--no-unlock-indicator
