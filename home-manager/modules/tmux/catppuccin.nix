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
    set -g status-right "#{E:@catppuccin_status_application}"
    set -agF status-right "#{E:@catppuccin_status_cpu}"
    set -ag status-right "#{E:@catppuccin_status_session}"
    set -ag status-right "#{E:@catppuccin_status_uptime}"
    set -agF status-right "#{E:@catppuccin_status_battery}"
    set -g status-left-length 100
    set -g status-left ""
    set -g @catppuccin_window_default_text " #W"
    set -g @catppuccin_window_current_text " #W"
    set -g @catppuccin_window_text " #W"
  '';
}
