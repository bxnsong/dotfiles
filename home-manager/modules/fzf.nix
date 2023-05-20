{ pkgs, ... }: {
  programs = {
    fzf = { enable = true; };
    zsh.sessionVariables = {
      FZF_DEFAULT_COMMAND =
        "fd --type f --color=always' --exclude .git --ignore-file ~/.gitignore";
    };
  };
}
