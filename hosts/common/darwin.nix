{ inputs, outputs, config, lib, hostname, system, username, pkgs, ... }:
let inherit (inputs) nixpkgs;
in {
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;

  nixpkgs.hostPlatform = lib.mkDefault "${system}";

  users.users.${username}.home = "/Users/${username}";
  system.primaryUser = "${username}";

  security.pam.services.sudo_local = {
    reattach = true;
    touchIdAuth = true;
  };

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.fira-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.jetbrains-mono
  ];

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    global.autoUpdate = true;

    casks = [ "arc" "discord" "ghostty" "orbstack" "raycast" ];
    brews = [ "aerospace" "borders" "sketchybar" ];
  };
}

