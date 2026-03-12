#!/usr/bin/env sh
player_status=$(playerctl -p spotify status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    output="$(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
else
    output=""
fi

# Some band names are too long to comfortably fit in the bar
output=$(echo "$output" | sed \
    -e "s/King Gizzard & The Lizard Wizard/King Gizz/" \
    -e "s/MASS OF THE FERMENTING DREGS/Masu Dore/" \
)

echo -e "{\"text\":\""$output"\", \"alt\":\"\", \"tooltip\":\"\"}"
