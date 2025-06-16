#!/bin/bash

# Main options
options="Shutdown\nReboot\nSuspend"
chosen=$(echo -e "$options" | dmenu -i -p "Power Menu:")

confirm() {
    echo -e "No\nYes" | dmenu -i -p "$1 Are you sure?"
}

case "$chosen" in
    Shutdown)
        response=$(confirm "Shutdown")
        [[ "$response" == "Yes" ]] && systemctl poweroff
        ;;
    Reboot)
        response=$(confirm "Reboot")
        [[ "$response" == "Yes" ]] && systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    *)
        exit 1
        ;;
esac

