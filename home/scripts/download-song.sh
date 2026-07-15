if (( $# != 1 )); then
    echo "Usage: download-song <youtube-url>" >&2
    exit 1
fi

: "${DOWNLOAD_SONG_DESTINATION:?The download-song destination is not configured}"

temporary_directory="$(mktemp -d)"

trap 'rm -rf "$temporary_directory"' EXIT

mkdir -p "$DOWNLOAD_SONG_DESTINATION"

yt-dlp \
    -x \
    --audio-format mp3 \
    --audio-quality 0 \
    --paths "home:$DOWNLOAD_SONG_DESTINATION" \
    --paths "temp:$temporary_directory" \
    "$1"
