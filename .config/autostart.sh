#!/usr/bin/env sh
# Keymaps 

# Make CAPS lock an extra escape key
setxkbmap -option caps:escape

# Compositor
killall compton
compton

# Restore Wallpaper
nitrogen --Restore

# Polybar
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep; done
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-i3 &
    done
else
    polybar --reload mainbar-i3 &
fi