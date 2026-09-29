#!/bin/bash
repo=$(checkupdates 2>/dev/null | wc -l)
aur=$(yay -Qua 2>/dev/null | wc -l)
total=$(( repo + aur ))

if [ "$total" -gt 0 ]; then
    tip="Repo: $repo"$'\n'"AUR: $aur"
    jq -cn --arg t "$total" --arg tip "$tip" '{text: $t, tooltip: $tip}'
fi
