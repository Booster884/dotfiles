#!/usr/bin/env sh

# Terminate already running polybar instances
killall -q polybar

# Wait to allow processes to be stopped
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar using the config in ~/.config/polybar/config
polybar mybar &
