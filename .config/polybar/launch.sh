#!/usr/bin/env sh

# Terminate already running polybar instances
pkill polybar

# Wait to allow processes to be stopped
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar using the config in ~/.config/polybar/config
#polybar mybar &

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload mybar &
	done
else
	polybar --reload mybar &
fi
