#!/bin/sh
# Ref: https://code.krister.ee/lock-screen-in-sway/
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock -c 550000
# Kills last background task so idle timer doesn't keep running
kill %%
