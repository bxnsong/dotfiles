return {
  {
    "m4xshen/catppuccinight.nvim",
    name = "catppuccinight",
    opts = {
      flavour = "mocha",
      custom_highlights = function(colours)
        return {
          VertSplit = { fg = colours.surface0 },
        }
      end,
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
