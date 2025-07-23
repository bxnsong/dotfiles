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

  system.activationScripts.postActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle when changing settings
    sudo -u ${username} /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
      dock.persistent-apps = [
        "${pkgs.ghostty-bin}/Applications/Ghostty.app"
        "/Applications/Arc.app"
        "/Applications/Discord.app"
      ];
      dock.autohide = true;
      dock.show-recents = false;
      loginwindow.GuestEnabled = false;
      NSGlobalDomain."com.apple.swipescrolldirection" = false;
      NSGlobalDomain._HIHideMenuBar = true;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.KeyRepeat = 1;
      NSGlobalDomain.InitialKeyRepeat = 10;
      screencapture.location = "~/Documents/Screenshots";
      screencapture.type = "png";

      CustomUserPreferences = {
        "com.raycast.macos" = { raycastGlobalHotkey = "Command-49"; };
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "64" = {
              enabled = false;
              value = {
                parameters = [ 32 49 1048576 ];
                type = "standard";
              };
            };
            "65" = {
              enabled = false;
              value = {
                parameters = [ 32 49 1572864 ];
                type = "standard";
              };
            };
          };
        };
      };
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.fira-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.jetbrains-mono
  ];

  services.sketchybar = { enable = true; };
  services.jankyborders = {
    enable = true;
    width = 5.0;
    active_color = "0xffc5a7f2";
    inactive_color = "0xff494d64";
  };
  services.aerospace = {
    enable = true;

    settings = {
      after-login-command = [ ];

      # Normalization settings
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      # Layout configuration
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      # Key mapping
      key-mapping.preset = "qwerty";

      # Gaps configuration
      gaps = {
        inner = {
          horizontal = 16;
          vertical = 16;
        };
        outer = {
          left = 16;
          bottom = 16;
          top = 8;
          right = 16;
        };
      };

      # Key bindings - main mode
      mode.main.binding = {
        # Layout commands
        "alt-slash" = "layout tiles horizontal vertical";
        "alt-comma" = "layout accordion horizontal vertical";

        # Focus commands
        "alt-h" = "focus left";
        "alt-j" = "focus down";
        "alt-k" = "focus up";
        "alt-l" = "focus right";

        # Move commands
        "alt-shift-h" = "move left";
        "alt-shift-j" = "move down";
        "alt-shift-k" = "move up";
        "alt-shift-l" = "move right";

        # Resize commands
        "alt-shift-minus" = "resize smart -50";
        "alt-shift-equal" = "resize smart +50";

        # Workspace navigation
        "alt-1" = "workspace 1";
        "alt-2" = "workspace 2";
        "alt-3" = "workspace 3";
        "alt-4" = "workspace 4";
        "alt-5" = "workspace 5";
        "alt-6" = "workspace 6";
        "alt-7" = "workspace 7";
        "alt-8" = "workspace 8";
        "alt-9" = "workspace 9";

        # Move node to workspace
        "alt-shift-1" = "move-node-to-workspace 1";
        "alt-shift-2" = "move-node-to-workspace 2";
        "alt-shift-3" = "move-node-to-workspace 3";
        "alt-shift-4" = "move-node-to-workspace 4";
        "alt-shift-5" = "move-node-to-workspace 5";
        "alt-shift-6" = "move-node-to-workspace 6";
        "alt-shift-7" = "move-node-to-workspace 7";
        "alt-shift-8" = "move-node-to-workspace 8";
        "alt-shift-9" = "move-node-to-workspace 9";

        # Workspace and monitor management
        "alt-tab" = "workspace-back-and-forth";
        "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

        # Mode switching
        "alt-shift-semicolon" = "mode service";
      };

      # Key bindings - service mode
      mode.service.binding = {
        "esc" = [ "reload-config" "mode main" ];
        "r" = [ "flatten-workspace-tree" "mode main" ]; # reset layout
        "f" = [
          "layout floating tiling"
          "mode main"
        ]; # Toggle between floating and tiling layout
        "backspace" = [ "close-all-windows-but-current" "mode main" ];

        "alt-shift-h" = [ "join-with left" "mode main" ];
        "alt-shift-j" = [ "join-with down" "mode main" ];
        "alt-shift-k" = [ "join-with up" "mode main" ];
        "alt-shift-l" = [ "join-with right" "mode main" ];
      };

      # Window detection rules
      on-window-detected = [{
        "if".app-id = "com.mitchellh.ghostty";
        run = [ "layout tiling" ];
      }];
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    global.autoUpdate = true;
    casks = [ "arc" "bitwarden" "desktoppr" "discord" "orbstack" "raycast" ];
    brews = [ ];
  };
}

