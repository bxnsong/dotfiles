{ pkgs, ... }: {
  home.packages = with pkgs; [ git delta lazygit ];
  programs = {
    lazygit = {
      enable = true;
      settings = {
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
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
