{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    caddy
    codex
    colima
    docker
    graphviz
    jq
    ktlint
    mycli
    mysql84
    pulumi
    pyenv
    redis
    slack
    wget
    zulu8
  ];

  programs.git = { userEmail = "ben.soh@usepylon.com"; };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
