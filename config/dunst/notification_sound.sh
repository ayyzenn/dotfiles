#!/bin/bash

# Dunst notification sound script
# Arguments: appname summary body icon urgency

APPNAME="$1"
SUMMARY="$2"
BODY="$3"
ICON="$4"
URGENCY="$5"

# Define sound files based on urgency
case "$URGENCY" in
    "CRITICAL")
        SOUND="/usr/share/sounds/freedesktop/stereo/dialog-error.oga"
        ;;
    "NORMAL")
        SOUND="/usr/share/sounds/freedesktop/stereo/message.oga"
        ;;
    "LOW")
        SOUND="/usr/share/sounds/freedesktop/stereo/bell.oga"
        ;;
    *)
        SOUND="/usr/share/sounds/freedesktop/stereo/message.oga"
        ;;
esac

# Play the sound using paplay (PulseAudio)
paplay "$SOUND" 2>/dev/null &
