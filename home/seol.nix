{ pkgs, ... }: {
  home.packages = with pkgs; [ qmk yt-dlp ];

  programs.codex = {
    enable = true;
    settings = {
      mcp_servers = {
        serena = {
          command = "uvx";
          args = [
            "--from"
            "git+https://github.com/oraios/serena"
            "serena"
            "start-mcp-server"
            "--context"
            "codex"
          ];
        };
      };
    };
  };
}

