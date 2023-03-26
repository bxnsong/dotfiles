{ pkgs, ... }: {
  home.packages = with pkgs; [ tree-sitter ];
  programs = {
    neovim = {
      enable = true;
      extraLuaConfig = (builtins.readFile ./init.lua);
    };
  };
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
