{ pkgs, lib, userConfig, ... }: {

  home = {
    stateVersion = "25.11";
    username = userConfig.username;
    homeDirectory = userConfig.homeDirectory;
    packages = with pkgs; [
      biome
      chafa
      corepack
      delta
      eza
      fd
      ffmpeg-full
      gcc
      just
      neofetch
      nixfmt-classic
      ripgrep
      rustup
      tldr
      tree-sitter
      unzip
      uv
      zoxide
    ];
  };

  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    terminal = "screen-256color";
    prefix = "C-a";
    plugins = [
      (import ./tmux/catppuccin.nix { inherit pkgs; })
      pkgs.tmuxPlugins.fpp
      pkgs.tmuxPlugins.tmux-thumbs
    ];
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
      gui.theme = {
        lightTheme = false;
        activeBorderColor = [
          "#a6e3a1" # Green
          "bold"
        ];
        inactiveBorderColor = [
          "#cdd6f4" # Text
        ];
        optionsTextColor = [
          "#89b4fa" # Blue
        ];
        selectedLineBgColor = [
          "#313244" # Surface0
        ];
        selectedRangeBgColor = [
          "#313244" # Surface0
        ];
        cherryPickedCommitBgColor = [
          "#94e2d5" # Teal
        ];
        cherryPickedCommitFgColor = [
          "#89b4fa" # Blue
        ];
        unstagedChangesColor = [
          "red" # Red
        ];
      };
    };
  };

  programs.neovim = {
    enable = true;
    extraLuaConfig = ''require("config.lazy")'';
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    oh-my-zsh = {
      enable = true;
      plugins = [ "gitfast" ];
      theme = "clean";
    };
    shellAliases = {
      v = "nvim";
      vim = "nvim";
      ls = "eza --icons=always";
      lg = "lazygit";
      cat = "bat";
      nnn = "nnn -APp";
      mux = "tmuxinator";
    };
    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
      PATH = "\${PATH}";
    };
    initContent = (builtins.readFile ./zsh/zshrc);
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = pkgs.lib.importTOML ./starship/starship.toml;
  };

  programs.git = {
    enable = true;
    userName = "Ben Soh";
    userEmail = lib.mkDefault "ben.xiao.soh@gmail.com";
    includes = [{ path = "~/.config/git/themes.gitconfig"; }];
    ignores = [ ".neoconf.json" "*.swp" ];
    extraConfig = {
      core = { pager = "delta"; };
      delta = {
        navigate = true;
        light = false;
        features = "catppuccin-mocha";
      };
      diff.colorMoved = "default";
      fetch.prune = true;
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      pull.rebase = true;
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };
  };

  programs.fzf = {
    enable = true;
    defaultCommand =
      "fd --type f --color=always --exclude .git --ignore-file ~/.gitignore";
    colors = {
      bg = "#1e1e2e";
      "bg+" = "#313244";
      spinner = "#f5e0dc";
      hl = "#f38ba8";
      fg = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      "fg+" = "#cdd6f4";
      prompt = "#cba6f7";
      "hl+" = "#f38ba8";
    };
  };

  programs.bat = {
    enable = true;
    config = { theme = "mocha"; };
    themes = {
      mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };

  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
    enableZshIntegration = true;
    themes = {
      calvera = {
        background = "0c0c1f";
        foreground = "b3b1ad";
        selection-foreground = "000000";
        selection-background = "ffc600";
        cursor-color = "ffcc00";
        palette = [
          "0=#091934"
          "1=#f78c6c"
          "2=#adcea1"
          "3=#f9af4f"
          "4=#53bdfa"
          "5=#fae994"
          "6=#90e1c6"
          "7=#c7c7c7"
          "8=#686868"
          "9=#f07178"
          "10=#c2d94c"
          "11=#ffb454"
          "12=#59c2ff"
          "13=#ffee99"
          "14=#95e6cb"
          "15=#ffffff"
        ];
      };
      catppuccin-mocha = {
        palette = [
          "0=#45475a"
          "1=#f38ba8"
          "2=#a6e3a1"
          "3=#f9e2af"
          "4=#89b4fa"
          "5=#f5c2e7"
          "6=#94e2d5"
          "7=#bac2de"
          "8=#585b70"
          "9=#f38ba8"
          "10=#a6e3a1"
          "11=#f9e2af"
          "12=#89b4fa"
          "13=#f5c2e7"
          "14=#94e2d5"
          "15=#a6adc8"
        ];
        background = "1e1e2e";
        foreground = "cdd6f4";
        cursor-color = "f5e0dc";
        selection-background = "353749";
        selection-foreground = "cdd6f4";
      };
    };
    settings = {
      font-size = 12;
      window-padding-x = 16;
      window-padding-y = 6;
      bold-is-bright = true;
      theme = "calvera";
      macos-titlebar-style = "hidden";
    };
  };

  xdg.configFile = {
    "git/themes.gitconfig".text = builtins.readFile ./git/themes.gitconfig;
    nvim = {
      source = ./nvim/config;
      recursive = true;
    };
  };
}
