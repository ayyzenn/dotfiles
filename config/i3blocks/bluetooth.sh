#!/bin/bash

config="$HOME/.config/i3blocks/bt-devices.conf"
mode_file="$HOME/.config/i3blocks/bt-mode"

# Read device list
mapfile -t macs < <(awk '{print $1}' "$config")

# Right-click cycles to next device
if [[ "$BLOCK_BUTTON" == "3" ]]; then
    current=$(<"$mode_file")
    index=-1
    for i in "${!macs[@]}"; do
        [[ "${macs[$i]}" == "$current" ]] && index=$i && break
    done
    next_index=$(( (index + 1) % ${#macs[@]} ))
    echo "${macs[$next_index]}" > "$mode_file"
fi

# Get the selected MAC
selected_mac=$(<"$mode_file")
info=$(bluetoothctl info "$selected_mac" 2>/dev/null)

if echo "$info" | grep -q "Connected: yes"; then
    label=$(awk -v mac="$selected_mac" '$1 == mac {print $2}' "$config")
    icon=$(awk -v mac="$selected_mac" '$1 == mac {print $3}' "$config")

    battery_hex=$(echo "$info" | grep "Battery Percentage" | awk '{print $3}' | sed 's/0x//')
    if [[ -n "$battery_hex" ]]; then
        battery=$((16#$battery_hex))
        echo "$icon $battery%"
        exit 0
    fi
fi

#echo " "
echo "🛜"
