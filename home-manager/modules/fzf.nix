{ pkgs, ... }: {
  home.sessionVariables = {
    FZF_DEFAULT_COMMAND =
      "fd --type f --color=always' --exclude .git --ignore-file ~/.gitignore";
  };
  programs = { fzf = { enable = true; }; };
}
