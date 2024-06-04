return {

  -- disable the following plugins because of perf
  { "echasnovski/mini.indentscope", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "bufferline.nvim", enabled = false },

  {
    "echasnovski/mini.surround",
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
    "m4xshen/catppuccinight.nvim",
    lazy = false,
    name = "catppuccinight",
    opts = {
      flavour = "mocha",
      custom_highlights = function(colours)
        return {
          VertSplit = { fg = colours.surface0 },
        }
      end,
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = { "plenary.nvim", "ojroques/vim-oscyank" },
    opts = {
      action_callback = function(url)
        vim.api.nvim_command("let @\" = '" .. url .. "'")
        vim.fn.OSCYank(url)
      end,
    },
  },

  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_ignored_filetypes = { "octo" }
    end,
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
}
