{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    caddy
    colima
    docker
    fzf
    graphviz
    jq
    mycli
    mysql84
    pulumi
    pyenv
    redis
    slack
    wget
  ];

  programs.git = { userEmail = "ben.soh@usepylon.com"; };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
