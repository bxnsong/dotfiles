{ pkgs, ... }: {
  home.packages = with pkgs; [
    luajit
    luarocks
  ];
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
