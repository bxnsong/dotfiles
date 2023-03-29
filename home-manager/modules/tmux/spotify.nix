{ pkgs, ... }: {
  plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "spotify";
    version = "v1.1";
    src = pkgs.fetchFromGitHub {
      owner = "bxnsong";
      repo = "tmux-spotify";
      rev = "v1.1";
      sha256 = "0kcwx6q4qqz1pi45grfmhb877k10zkryi250hng9hvj0afnlcq1a";
    };
  };

  extraConfig = ''
    set -g @spotifybinding 'S'
  '';
}
