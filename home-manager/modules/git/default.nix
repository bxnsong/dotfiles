{ pkgs, ... }: {
  home.packages = with pkgs; [ delta ];
  xdg.configFile = {
    "git/themes.gitconfig".text = builtins.readFile ./themes.gitconfig;
  };
  programs = {
    gitui = {
      enable = true;
      keyConfig = ''
        (
          move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),

          stash_open: Some(( code: Char('l'), modifiers: ( bits: 0,),)),

          open_help: Some(( code: F(1), modifiers: ( bits: 0,),)),
        )
      '';
      theme = ''
        (
          selected_tab: Reset,
          command_fg: Rgb(205, 214, 244),
          selection_bg: Rgb(88, 91, 112),
          selection_fg: Rgb(205, 214, 244),
          cmdbar_bg: Rgb(24, 24, 37),
          cmdbar_extra_lines_bg: Rgb(24, 24, 37),
          disabled_fg: Rgb(127, 132, 156),
          diff_line_add: Rgb(166, 227, 161),
          diff_line_delete: Rgb(243, 139, 168),
          diff_file_added: Rgb(249, 226, 175),
          diff_file_removed: Rgb(235, 160, 172),
          diff_file_moved: Rgb(203, 166, 247),
          diff_file_modified: Rgb(250, 179, 135),
          commit_hash: Rgb(180, 190, 254),
          commit_time: Rgb(186, 194, 222),
          commit_author: Rgb(116, 199, 236),
          danger_fg: Rgb(243, 139, 168),
          push_gauge_bg: Rgb(137, 180, 250),
          push_gauge_fg: Rgb(30, 30, 46),
          tag_fg: Rgb(245, 224, 220),
          branch_fg: Rgb(148, 226, 213)
        )
      '';
    };
    lazygit = {
      enable = true;
      settings = {
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
        gui.theme = {
          lightTheme = false;
          activeBorderColor = [
            "#a6e3a1" # Green
            "bold"
          ];
          inactiveBorderColor = [
            "#cdd6f4" # Text
          ];
          optionsTextColor = [
            "#89b4fa" # Blue
          ];
          selectedLineBgColor = [
            "#313244" # Surface0
          ];
          selectedRangeBgColor = [
            "#313244" # Surface0
          ];
          cherryPickedCommitBgColor = [
            "#94e2d5" # Teal
          ];
          cherryPickedCommitFgColor = [
            "#89b4fa" # Blue
          ];
          unstagedChangesColor = [
            "red" # Red
          ];
        };
      };
    };
    git = {
      enable = true;
      userName = "Ben Soh";
      userEmail = "ben.soh@discordapp.com";
      includes = [{ path = "~/.config/git/themes.gitconfig"; }];
      extraConfig = {
        pull.rebase = true;
        fetch.prune = true;
        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";
        delta.navigate = true;
        delta.light = false;
        delta.features = "collared-trogon";
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
      };
    };
  };
}
