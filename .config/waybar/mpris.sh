#!/usr/bin/env sh
player_status=$(playerctl -p spotify status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	output="$(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
else
	output=""
fi

# King Gizzard have a band name that causes wrapping >:(
output=$(echo "$output" | sed "s/King Gizzard & The Lizard Wizard/King Gizz/")

echo -e "{\"text\":\""$output"\", \"alt\":\"\", \"tooltip\":\"\"}"
