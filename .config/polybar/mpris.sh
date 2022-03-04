#!/bin/env sh
player_status=$(playerctl status -i firefox,chromium 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	echo "$(playerctl metadata artist) - $(playerctl metadata title)"
else
	echo ""
fi
