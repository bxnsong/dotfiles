#!/bin/sh

window_state() {
    source "$HOME/.config/sketchybar/colors.sh"
    source "$HOME/.config/sketchybar/icons.sh"

    WINDOW=$(yabai -m query --windows --window)
    CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

    args=()
    if [[ $CURRENT -gt 0 ]]; then
        LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
        args+=(--set $NAME icon=$YABAI_STACK icon.color=$RED label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
        yabai -m config active_window_border_color $RED > /dev/null 2>&1 &

    else 
        args+=(--set $NAME label.drawing=off)
        case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
            "false")
                if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
                    args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$GREEN)
                    borders active_color=$GREEN > /dev/null 2>&1 &
                elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
                    args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$BLUE)
                    borders active_color=$BLUE > /dev/null 2>&1 &
                else
                    args+=(--set $NAME icon=$YABAI_GRID icon.color=$ORANGE)
                    borders active_color=$YABAI_WINDOW_BORDER > /dev/null 2>&1 &
                fi
                ;;
            "true")
                args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$MAGENTA)
                borders active_color=$MAGENTA > /dev/null 2>&1 &
                ;;
        esac
    fi

    sketchybar -m "${args[@]}"
}

windows_on_spaces () {
    CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

    args=()
    while read -r line
    do
        for space in $line
        do
            icon_strip=" "
            apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
            while read -r app
            do
                if ! [[ -z "$apps" ]]; then
                    icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
                fi
            done <<< "$apps"
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
  done
done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  update
}

case "$SENDER" in
    "mouse.clicked") mouse_clicked
        ;;
    "forced") exit 0
        ;;
    "window_focus") window_state 
        ;;
    "windows_on_spaces") windows_on_spaces
        ;;
esac
