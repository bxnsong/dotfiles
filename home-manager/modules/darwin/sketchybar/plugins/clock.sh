#!/usr/bin/env zsh

sketchybar --set $NAME label="$(date '+%a %b %-d %-H:%M') (PT $(TZ='America/Los_Angeles' date '+%a %b %-d %-H:%M'))"
