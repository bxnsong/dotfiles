{ pkgs, ... }: {
  home.packages = with pkgs; [ tree-sitter ];
  programs = {
    neovim = {
      enable = true;
      extraLuaConfig = "require(\"config.lazy\")";
    };
  };
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
