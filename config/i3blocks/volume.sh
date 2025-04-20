#!/bin/bash

# Handle clicks
case "$BLOCK_BUTTON" in
    1)  # Left click – Toggle mute
        amixer set Master toggle > /dev/null
        ;;
    4)  # Scroll up – Volume up
        amixer set Master 5%+ > /dev/null
        ;;
    5)  # Scroll down – Volume down
        amixer set Master 5%- > /dev/null
        ;;
esac

# Get mute status and volume
amixer get Master | grep -q '\[off\]'
IS_MUTED=$?

VOLUME=$(amixer get Master | awk -F'[][]' '/%/ { print $2; exit }' | tr -d '%')

# Choose icon
if [ $IS_MUTED -eq 0 ]; then
    ICON="🔇"
elif [ "$VOLUME" -eq 0 ]; then
    ICON="🔈"
elif [ "$VOLUME" -le 50 ]; then
    ICON="🔉"
else
    ICON="🔊"
fi

echo "$ICON $VOLUME%"

