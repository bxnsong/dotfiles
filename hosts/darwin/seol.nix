{ ... }: {
  homebrew = { casks = [ "onedrive" "orbstack" "firefox" ]; };
  services.tailscale.enable = true;
}
