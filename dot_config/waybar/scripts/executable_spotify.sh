#!/bin/bash
# Issue with this script if song contains & char
bars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

make_frame() {
    local f=""
    for _ in {1..4}; do
        f+="${bars[RANDOM % ${#bars[@]}]}"
    done
    echo "$f"
}

while true; do
    status=$(playerctl -p spotify status 2>/dev/null)

    if [ "$status" = "Playing" ]; then
        info=$(playerctl -p spotify metadata --format '{{artist}} - {{title}}')
        jq -cn --arg t "$info $(make_frame)" \
            '{text: $t, class: ["custom-spotify", "playing"]}'
    elif [ "$status" = "Paused" ]; then
        info=$(playerctl -p spotify metadata --format '{{artist}} - {{title}}')
        jq -cn --arg t "$info" \
            '{text: $t, class: ["custom-spotify", "paused"]}'
    else
        echo '{"text": "", "class": "custom-spotify"}'
    fi
    sleep 0.25
done
