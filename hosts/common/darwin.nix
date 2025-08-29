{ inputs, config, lib, system, username, pkgs, ... }: {
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "${system}";
    overlays = [ inputs.nix-vscode-extensions.overlays.default ];
  };

  system.stateVersion = 6;

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
      loginwindow.GuestEnabled = false;
      screencapture.location = "~/Documents/Screenshots";
      screencapture.type = "png";

      dock = {
        persistent-apps = [
          "${pkgs.ghostty-bin}/Applications/Ghostty.app"
          "/Applications/Arc.app"
          "/Applications/Discord.app"
        ];
        autohide = true;
        show-recents = false;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        _HIHideMenuBar = true;
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 1;
        InitialKeyRepeat = 10;
        ApplePressAndHoldEnabled = false;
      };

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

        # Toggle between floating/tiling
        "alt-shift-space" = "layout floating tiling";

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

        # Alternate workspace navigation
        "alt-q" = "workspace 1";
        "alt-w" = "workspace 2";
        "alt-e" = "workspace 3";
        "alt-r" = "workspace 4";
        "alt-t" = "workspace 5";

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
      on-window-detected = [
        {
          "if".app-name-regex-substring = "Cursor";
          run = [ "layout tiling" "move-node-to-workspace 1" ];
        }
        {
          "if".app-id = "company.thebrowser.Browser";
          run = [ "layout tiling" "move-node-to-workspace 2" ];
        }
        {
          "if".app-id = "com.hnc.Discord";
          run = [ "layout tiling" "move-node-to-workspace 3" ];
        }
        {
          "if".app-id = "com.anthropic.claudefordesktop";
          run = [ "layout tiling" "move-node-to-workspace 4" ];
        }
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = [ "layout tiling" "move-node-to-workspace 5" ];
        }
      ];
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
    casks = [ "claude" "desktoppr" "onedrive" "orbstack" ];
    brews = [ ];
    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}

