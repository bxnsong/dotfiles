{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      keybindings = [
        {
          key = "ctrl+u";
          command = "extension.smoothscroll_cursorUp";
        }
        {
          key = "ctrl+d";
          command = "extension.smoothscroll_cursorDown";
        }
        {
          key = "ctrl+l";
          command = "workbench.action.navigateRight";
          when = "!editorTextFocus";
        }
        {
          key = "ctrl+h";
          command = "workbench.action.navigateLeft";
          when = "!editorTextFocus";
        }
        {
          key = "ctrl+n";
          command = "goToNextReference";
          when = "inReferenceSearchEditor || referenceSearchVisible";
        }
        {
          key = "ctrl+p";
          command = "goToPreviousReference";
          when = "inReferenceSearchEditor || referenceSearchVisible";
        }
        {
          key = "enter";
          command = "closeReferenceSearch";
          when = "inReferenceSearchEditor || referenceSearchVisible";
        }
      ];

      userSettings = {
        editor = {
          cursorBlinking = "smooth";
          cursorSmoothCaretAnimation = "on";
          fontFamily = "'FiraCode Nerd Font', Monaco, 'Courier New', monospace";
          formatOnSave = true;
          guides = { indentation = false; };
          gotoLocation = { multipleDefinitions = "goto"; };
          scrollbar = {
            horizontal = "hidden";
            vertical = "hidden";
          };
          smoothScrolling = true;
          lineNumbers = "relative";
        };
        breadcrumbs = { enabled = false; };
        diffEditor = { codelens = true; };
        extensions = {
          autoUpdate = false;
          experimental = { affinity = { "asvetliakov.vscode-neovim" = 1; }; };
        };
        git = { autofetch = true; };
        gitlens = { plusFeatures = { enabled = false; }; };
        window = { customTitleBarVisibility = "never"; };
        workbench = {
          activityBar = {
            location = "hidden";
            orientation = "vertical";
          };
          colorTheme = "Celestial";
          editor = {
            showTabs = "none";
            limit = {
              enabled = true;
              perEditorGroup = true;
              value = 1;
            };
          };
          iconTheme = "material-icon-theme";
          statusBar = { visible = true; };
        };
        "vscode-neovim" = {
          compositeKeys = { "jk" = { command = "vscode-neovim.escape"; }; };
        };
        "oil-code.disableVimKeymaps" = true;
      };
      extensions = with pkgs.vscode-marketplace; [
        apvarun.celestial
        astro-build.astro-vscode
        asvetliakov.vscode-neovim
        bradlc.vscode-tailwindcss
        cyansprite.smoothscroll
        dracula-theme.theme-dracula
        eamodio.gitlens
        haphazarddev.oil-code
        hsnazar.hyper-term-theme
        jnoortheen.nix-ide
        kokakiwi.vscode-just
        pkief.material-icon-theme
        samrapdev.outrun
        sumneko.lua
        tamasfe.even-better-toml
        tompollak.lazygit-vscode
        vitest.explorer
        yoavbls.pretty-ts-errors
      ];
    };
  };
  home.packages = with pkgs; [
    arc-browser
    claude-code
    code-cursor
    corepack
    discord
    jq
    nodePackages.nodejs
    raycast
    rustup
  ];
}

