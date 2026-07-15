{ pkgs, destination }:
pkgs.writeShellApplication {
  name = "download-song";
  runtimeInputs = [
    pkgs.ffmpeg
    pkgs.yt-dlp
  ];
  runtimeEnv.DOWNLOAD_SONG_DESTINATION = destination;
  text = builtins.readFile ./download-song.sh;
}
