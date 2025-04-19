#!/bin/bash

# Set the threshold levels
LOW_BATTERY=15
CRITICAL_BATTERY=10
DANGER_BATTERY=5
FULL_ALERT=93

# To prevent repeat alerts
ALERTED_FULL=false

while true; do
    # Get the battery percentage and charging status
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [[ "$STATUS" == "Discharging" ]]; then
        ALERTED_FULL=false  # Reset full alert when discharging

        if [[ "$BATTERY_LEVEL" -le $DANGER_BATTERY ]]; then
            notify-send -u critical "Battery Critically Low!" "Battery at $BATTERY_LEVEL%. System will shut down soon!" -t 5000
        elif [[ "$BATTERY_LEVEL" -le $CRITICAL_BATTERY ]]; then
            notify-send -u critical "Battery Low" "Battery at $BATTERY_LEVEL%. Plug in your charger!" -t 5000
        elif [[ "$BATTERY_LEVEL" -le $LOW_BATTERY ]]; then
            notify-send -u normal "Battery Warning" "Battery at $BATTERY_LEVEL%. Consider charging soon." -t 5000
        fi
    elif [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
        if [[ "$BATTERY_LEVEL" -ge $FULL_ALERT && "$ALERTED_FULL" == false ]]; then
            notify-send -u normal "🔋 Battery Almost Full" "Battery at $BATTERY_LEVEL%. You can unplug the charger soon." -t 5000
            ALERTED_FULL=true
        fi
    fi

    # Check battery every 2 minutes
    sleep 120
done

