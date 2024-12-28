{ pkgs, ... }: {
  plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "2.1.2";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "v2.1.2";
      sha256 = "sha256-vBYBvZrMGLpMU059a+Z4SEekWdQD0GrDqBQyqfkEHPg=";
    };
  };

  extraConfig = ''
    set -ogq @catppuccin_flavor "mocha"
    set -ogq @catppuccin_window_status_style "rounded"
    set -g status-right-length 100
    set -g status-right "#{E:@catppuccin_status_application}#{E:@catppuccin_status_session}"
    set -g status-left ""
  '';
}
