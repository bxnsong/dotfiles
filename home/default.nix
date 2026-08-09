{
  pkgs,
  lib,
  userConfig,
  config,
  ...
}:
{
  home = {
    stateVersion = "25.11";
    inherit (userConfig) username homeDirectory;

    packages = with pkgs; [
      biome
      chafa
      delta
      difftastic
      eza
      fastfetch
      fd
      gcc
      just
      nixfmt
      ripgrep
      rustup
      statix
      tldr
      tree-sitter
      unzip
      uv
      zoxide
    ];
  };

  manual.manpages.enable = false;

  programs = {
    home-manager.enable = true;

    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings.default_mode = "locked";
      settings.theme = "luna";
      themes.luna = ''
        themes {
          luna {
            fg 228 228 232
            bg 6 6 6
            black 0 0 0
            red 174 73 73
            green 111 190 128
            yellow 217 163 90
            blue 117 161 199
            magenta 196 168 214
            cyan 117 161 199
            white 199 199 199
            orange 194 145 106
          }
        }
      '';
    };

    lazygit = {
      enable = true;
      settings = {
        git.diffRenderers = [
          {
            type = "extDiff";
            command = "difft --color=always --context={{diffContext}}";
          }
        ];
        gui = {
          nerdFontsVersion = "3";
          theme = {
            activeBorderColor = [
              "#75a1c7"
              "bold"
            ];
            inactiveBorderColor = [ "#404040" ];
            optionsTextColor = [ "#75a1c7" ];
            selectedLineBgColor = [ "#212121" ];
            selectedRangeBgColor = [ "#212121" ];
            cherryPickedCommitBgColor = [ "#c4a8d6" ];
            cherryPickedCommitFgColor = [ "#75a1c7" ];
            unstagedChangesColor = [ "#e08585" ];
            defaultFgColor = [ "#e4e4e8" ];
            searchingActiveBorderColor = [
              "#d9a35a"
              "bold"
            ];
          };
        };
      };
    };

    neovim = {
      enable = true;
      initLua = ''require("config.lazy")'';
      defaultEditor = true;
      withPython3 = true;
      withRuby = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      dotDir = "${config.home.homeDirectory}/.config/zsh";
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
      initContent = builtins.readFile ./zsh/zshrc;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = pkgs.lib.importTOML ./starship/starship.toml;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Ben Soh";
          email = lib.mkDefault "ben.xiao.soh@gmail.com";
        };
        core = {
          pager = "delta";
        };
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
      includes = [ { path = "~/.config/git/themes.gitconfig"; } ];
      ignores = [
        ".neoconf.json"
        "*.swp"
        ".lazy.lua"
      ];
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        editor = "nvim";
      };
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --color=always --exclude .git --ignore-file ~/.gitignore";
      defaultOptions = [ "--multi" ];
      colors = {
        "bg+" = "#1c1c1c";
        bg = "#060606";
        spinner = "#a8a8a8";
        hl = "#c2916a";
        fg = "#e4e4e8";
        header = "#c2916a";
        info = "#8c9cb8";
        pointer = "#a8a8a8";
        marker = "#b09080";
        "fg+" = "#c7c7c7";
        prompt = "#75a1c7";
        "hl+" = "#c2916a";
        border = "#060606";
      };
    };

    bat = {
      enable = true;
      config = {
        theme = "luna";
      };
      themes = {
        luna = {
          src = pkgs.fetchFromGitHub {
            owner = "WTFox";
            repo = "luna.nvim";
            rev = "575b27d51cae6d5c07c769ed8754e51ea9ad8c85";
            hash = "sha256-HcMJnNcbVrmNfGw3/4tXVl1Q0l8ZDxJaN9ahBnJRGk4=";
          };
          file = "extras/bat/luna.tmTheme";
        };
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

    ghostty = {
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
        luna = {
          palette = [
            "0=#000000"
            "1=#e08585"
            "2=#6fbe80"
            "3=#c2916a"
            "4=#75a1c7"
            "5=#c4a8d6"
            "6=#75a1c7"
            "7=#c7c7c7"
            "8=#888888"
            "9=#e08585"
            "10=#6fbe80"
            "11=#d9a35a"
            "12=#8c9cb8"
            "13=#c4a8d6"
            "14=#75a1c7"
            "15=#ffffff"
            "16=#a8a8a8"
            "17=#c2916a"
            "18=#1c1c1c"
            "19=#404040"
            "20=#888888"
            "21=#c7c7c7"
          ];
          background = "060606";
          foreground = "e4e4e8";
          cursor-color = "e4e4e8";
          selection-background = "404040";
          selection-foreground = "e4e4e8";
        };
      };
      settings = {
        font-size = 12;
        window-padding-x = 16;
        window-padding-y = 6;
        bold-is-bright = true;
        theme = "luna";
        macos-titlebar-style = "hidden";
        macos-option-as-alt = true;
        clipboard-read = "allow";
        clipboard-write = "allow";
        copy-on-select = "clipboard";
      };
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
