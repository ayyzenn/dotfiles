#!/bin/bash

# Disable screen blanking and power management temporarily
xset s off
xset -dpms

# Get battery percentage
battery=$(cat /sys/class/power_supply/BAT*/capacity)
greeter_text="Endless Night | ${battery}%"

# Launch i3lock
i3lock \
  --blur 7 \
  --clock \
  --indicator \
  --radius 100 \
  --ring-width 6 \
  --inside-color=00000088 \
  --ring-color=ffffffaa \
  --line-color=00000000 \
  --keyhl-color=ffcc00ff \
  --bshl-color=ff0000ff \
  --separator-color=00000000 \
  --time-color=ffffffff \
  --date-color=aaaaaaff \
  --layout-color=ffffffff \
  --verif-color=89b4faFF \
  --wrong-color=ff0000ff \
  --time-font="Iosevka Nerd Font" \
  --date-font="JetBrains Mono" \
  --time-str="%I:%M:%S %p" \
  --date-str="%a, %b %d" \
  --greeter-text="$greeter_text" \
  --greeter-color=ffffffff \
  --greeter-font="Liberation Mono" \
  --greeter-pos="ix:iy+150"

