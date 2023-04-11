#!/usr/bin/env sh
player_status=$(playerctl -p spotify status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	output="$(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
else
	output=""
fi

echo -e "{\"text\":\""$output"\", \"alt\":\"\", \"tooltip\":\"\"}"
