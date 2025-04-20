#!/bin/bash

# Get volume info
amixer get Master | grep -q '\[off\]'
IS_MUTED=$?

VOLUME=$(amixer get Master | awk -F'[][]' '/%/ { print $2; exit }' | tr -d '%')

if [ $IS_MUTED -eq 0 ]; then
    ICON="🔇"  # muted
elif [ "$VOLUME" -eq 0 ]; then
    ICON="🔈"  # very low
elif [ "$VOLUME" -le 50 ]; then
    ICON="🔉"  # medium
else
    ICON="🔊"  # high
fi

echo "$ICON $VOLUME%"
