{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-nightly ];
  programs = {
    neovim = {
      enable = true;
      extraLuaConfig = ''
        require("config.options")
        require("config.lazy")
        require("config.keymaps")
        require("config.autocmds")
        local status, ts_install = pcall(require, "nvim-treesitter.install")
          if(status) then
            ts_install.compilers = { "${pkgs.gcc}/bin/gcc" }
          end
      '';
    };
  };
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
