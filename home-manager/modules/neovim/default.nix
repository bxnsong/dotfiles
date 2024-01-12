{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-nightly ];
  programs = {
    neovim = {
      enable = true;
      extraLuaConfig = ''require("config.lazy")'';
    };
  };
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
