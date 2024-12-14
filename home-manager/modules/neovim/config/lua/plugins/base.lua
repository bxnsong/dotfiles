return {

  -- disable the following plugins because of perf
  -- { "echasnovski/mini.indentscope", enabled = false },
  -- { "nvim-lualine/lualine.nvim", enabled = false },
  -- { "bufferline.nvim", enabled = false },

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
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    name = "fluoromachine",
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        theme = "fluoromachine",
        transparent = true,
      })

      -- vim.cmd.colorscheme("fluoromachine")
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },

  {
    "tiagovla/tokyodark.nvim",
    name = "tokyodark",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      -- vim.cmd.colorscheme("tokyodark")
    end,
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
      -- vim.cmd.colorscheme("catppuccin")
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
