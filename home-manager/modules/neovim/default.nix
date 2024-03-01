{ pkgs, ... }: {
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
