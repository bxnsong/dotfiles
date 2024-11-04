#!/usr/bin/env sh

sketchybar --add item rng right \
    --set rng \
    label.width=24 \
    label.align=right \
    update_freq=5 \
    script="$PLUGIN_DIR/rng.sh"
