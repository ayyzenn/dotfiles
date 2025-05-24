#!/bin/bash

# Get battery info
INFO=$(acpi -b)
STATUS=$(echo "$INFO" | awk -F '[, ]+' '{print $3}')
PERCENT=$(echo "$INFO" | grep -oP '[0-9]+(?=%)')

# Determine icon
if [[ "$STATUS" == "Charging" ]]; then
    ICON="🔌"
else
    if (( PERCENT < 15 )); then
        ICON="🪫"
    else
        ICON="🔋"
    fi
fi

# Print icon and percentage
echo "$ICON $PERCENT%"

