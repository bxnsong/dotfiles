{ pkgs, ... }: {
  plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "nova";
    version = "1.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "o0th";
      repo = "tmux-nova";
      rev = "1.1.0";
      sha256 = "1pyd2xpiw0rlx6ibp8hwzjdjkcxasfk01075xx59vhhfqfffj3nl";
    };
  };

  extraConfig = ''
    set -g @plugin 'o0th/tmux-nova'

    set -g @nova-nerdfonts true
    set -g @nova-nerdfonts-left 
    set -g @nova-nerdfonts-right 

    set -g @nova-segment-mode "#{?client_prefix,Ω,ω}"
    set -g @nova-segment-mode-colors "#50fa7b #282a36"

    set -g @nova-segment-whoami "#(whoami)@#h"
    set -g @nova-segment-whoami-colors "#50fa7b #282a36"

    set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

    set -g @nova-pane-justify "centre"

    set -g @nova-rows 0
    set -g @nova-segments-0-left "mode"
    set -g @nova-segments-0-right "whoami"
  '';
}
