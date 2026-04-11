{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pnpm
    qmk
    yt-dlp
  ];

  programs.codex = {
    enable = true;
    package = pkgs.llm-agents.codex;
    settings = {
      mcp_servers = {
        serena = {
          command = "serena";
          args = [
            "start-mcp-server"
            "--project-from-cwd"
            "--context"
            "codex"
          ];
        };
      };
    };
  };

  programs.go.enable = true;
}
