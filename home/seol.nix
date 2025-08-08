{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.formatOnSave" = true;
        "workbench.colorTheme" = "Outrun Electric";
        "editor.smoothScrolling" = true;
        "editor.guides.indentation" = false;
        "extensions.autoUpdate" = false;
        "git.autofetch" = true;
        "editor.lineNumbers" = "relative";
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "workbench.editor.showTabs" = "none";
        "breadcrumbs.enabled" = false;
        "workbench.statusBar.visible" = true;
        "workbench.activityBar.orientation" = "vertical";
        "workbench.activityBar.location" = "hidden";
        "editor.gotoLocation.multipleDefinitions" = "goto";
        "editor.fontFamily" =
          "'FiraCode Nerd Font', Monaco, 'Courier New', monospace";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "smooth";
        "diffEditor.codeLens" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "window.customTitleBarVisibility" = "never";
        "gitlens.plusFeatures.enabled" = false;
      };
      extensions = with pkgs.vscode-marketplace; [
        dracula-theme.theme-dracula
        asvetliakov.vscode-neovim
        hsnazar.hyper-term-theme
        samrapdev.outrun
        apvarun.celestial
      ];
    };
  };
  home.packages = with pkgs; [
    claude-code
    corepack
    jq
    nodePackages.nodejs
    rustup
  ];
}

