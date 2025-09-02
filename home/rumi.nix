{ pkgs, ... }: {
  home.packages = with pkgs; [ slack ];
  programs.git = { userEmail = "ben.soh@usepylon.com"; };
}
