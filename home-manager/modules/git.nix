{ pkgs, ... }: {
  home.packages = with pkgs; [ delta ];
  programs = {
    lazygit = {
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
    git = {
      enable = true;
      userName = "Ben Soh";
      userEmail = "ben.soh@discordapp.com";
      extraConfig = {
        pull.rebase = true;
        fetch.prune = true;
        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";
        delta.navigate = true;
        delta.light = false;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
      };
    };
  };
}
