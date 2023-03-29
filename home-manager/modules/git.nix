{ pkgs, ... }: {
  home.packages = with pkgs; [ git ];
  programs = {
    git = {
      enable = true;
      userName = "Ben Soh";
      userEmail = "ben.soh@discordapp.com";
      extraConfig = {
        pull.rebase = true;
        fetch.prune = true;
      };
    };
  };
}
