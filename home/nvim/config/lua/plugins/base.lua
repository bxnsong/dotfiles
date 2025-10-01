return {

  -- disable the following plugins because of perf
  { "bufferline.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "nvim-mini/mini.animate", cond = not vim.g.vscode },

  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
    },
  },

  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          keys = {
            stopinsert = false,
            win_p = false,
            prompt = { "<C-x>", "prompt" },
          },
        },
        -- mux = {
        --   backend = "zellij",
        --   enabled = true,
        -- },
      },
    },
    keys = {
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Claude Toggle",
        mode = { "n", "v" },
      },
    },
  },

  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },

  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
    },
  },

  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
    },
  },

  {
    "yashguptaz/calvera-dark.nvim",
    lazy = false,
    name = "calvera",
    init = function()
      vim.g.calvera_contrast = true
      vim.g.calvera_italic_comments = true
      vim.g.calvera_italic_keywords = true
      vim.g.calvera_italic_functions = true
      vim.g.calvera_italic_variables = false
    end,
    config = function()
      vim.cmd.colorscheme("calvera")
    end,
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = { "ojroques/vim-oscyank" },
    opts = {
      action_callback = function(url)
        vim.api.nvim_command("let @\" = '" .. url .. "'")
        vim.fn.OSCYank(url)
      end,
    },
  },

  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gdv", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
      { "<leader>gdm", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Open diff view (HEAD~1)" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory<cr>", desc = "Open file history" },
    },
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
    },
  },

  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_ignored_filetypes = { "octo" }
    end,
  },

  {
    "Wansmer/treesj",
    keys = {
      {
        "J",
        "<cmd>TSJToggle<cr>",
        desc = "Join toggle",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    }, -- if you install parsers with `nvim-treesitter`
    opts = {
      use_default_keymaps = false,
      max_join_length = 150,
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<C-h>"] = false,
        ["<C-s>"] = false,
        ["<C-l>"] = false,
        ["<C-t>"] = false,
        ["gs"] = "actions.select_vsplit",
        ["gh"] = "actions.select_split",
      },
    },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Open oil" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          -- {
          --   section = "terminal",
          --   cmd = "chafa ~/Downloads/5600-makima-evil-pfpsgg.png --format symbols --symbols vhalf --size 60x17; sleep .1",
          --   height = 17,
          --   padding = 1,
          -- },
          {
            {
              section = "header",
              padding = 1,
            },
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
        preset = {
          header = [[
        ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀
     ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷
    ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿
   ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿
 ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿
⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿
⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟
⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣
⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾
⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿
⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿
⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿
⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿
  ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃
⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ]],
        },
      },
    },
  },
}
