{ pkgs, ... }:
let
  yamlFormat = pkgs.formats.yaml { };
  generateGhDashConfig = repo: {
    theme = {
      colors = {
        text = {
          primary = "#cdd6f4";
          secondary = "#cba6f7";
          inverted = "#11111b";
          faint = "#bac2de";
          warning = "#f9e2af";
          success = "#a6e3a1";
          error = "#f38ba8";
        };
        background = {
          selected = "#313244";
        };
        border = {
          primary = "#cba6f7";
          secondary = "#45475a";
          faint = "#313244";
        };
      };
    };
    defaults = {
      view = "issues";
      layout = {
        issues = { };
        prs = { };
      };
      preview = {
        open = true;
        width = 100;
      };
    };
    prSections = [
      {
        title = "Open PRs";
        filters = "is:open repo:${repo}";
      }
      {
        title = "Needs My Review";
        filters = "is:open review-requested:@me repo:${repo}";
      }
      {
        title = "My PRs";
        filters = "is:open author:@me repo:${repo}";
      }
    ];
    issuesSections = [
      {
        title = "Open Issues";
        filters = "is:open repo:${repo}";
      }
    ];
    pager = {
      diff = "delta";
    };
    repoPaths = {
      "*/:repo" = "~/code/:repo";
    };
  };
in
{
  home.packages = with pkgs; [ delta ];
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
      ignores = [
        ".neoconf.json"
        "*.swp"
      ];
      extraConfig = {
        core = {
          pager = "delta";
        };
        delta = {
          navigate = true;
          light = false;
          features = "catppuccin-mocha";
        };
        diff.colorMoved = "default";
        fetch.prune = true;
        interactive.diffFilter = "delta --color-only";
        merge.conflictstyle = "diff3";
        pull.rebase = true;
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        editor = "nvim";
      };
    };
    gh-dash = {
      enable = true;
    };
  };
  xdg.configFile = {
    "git/themes.gitconfig".text = builtins.readFile ./themes.gitconfig;
    "gh-dash/pokerscope-config.yml".source = yamlFormat.generate "pokerscope-config.yml" (generateGhDashConfig "pokershare/pokershare");
    "gh-dash/discord-config.yml".source = yamlFormat.generate "discord-config.yml" (generateGhDashConfig "discord/discord");
  };
}
