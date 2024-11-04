#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

RNG=$((RANDOM % 100))

COLOR=$WHITE

case "$RNG" in
[7-9][0-9])
    COLOR=$GREEN
    ;;
[3-6][0-9])
    COLOR=$YELLOW
    ;;
[0-2][0-9])
    COLOR=$RED
    ;;
[0-9])
    COLOR=$RED
    ;;
esac

sketchybar --set $NAME label=$RNG label.color=$COLOR
