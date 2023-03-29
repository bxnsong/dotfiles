SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
POPUP_SCRIPT="sketchybar -m --set spotify.anchor popup.drawing=toggle"

cover=(
    script="$PLUGIN_DIR/spotify.sh"
    label.drawing=off
    icon.drawing=off
    background.image.scale=0.04
    background.image.drawing=on
    background.drawing=on
    padding_right=20
)

title=(
    icon.drawing=off
    y_offset=4
    width=0
    background.padding_left=0
    background.padding_right=0
    label.font="$FONT:Medium:14.0"
)

artist=(
    icon.drawing=off
    y_offset=-8
    background.padding_left=0
    background.padding_right=0
    label.font="$FONT:Medium:8.0"
)

sketchybar --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify.cover right --set spotify.cover "${cover[@]}" \
    --subscribe spotify.cover spotify_change \
    --add item spotify.title right --set spotify.title "${title[@]}" \
    --add item spotify.artist right --set spotify.artist "${artist[@]}"
