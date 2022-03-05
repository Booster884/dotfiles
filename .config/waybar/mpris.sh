#!/bin/env sh
player_status=$(playerctl status -i firefox,chromium 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	output="$(playerctl metadata artist) - $(playerctl metadata title)"
else
	output=""
fi

echo -e "{\"text\":\""$output"\", \"alt\":\"\", \"tooltip\":\"\"}"
