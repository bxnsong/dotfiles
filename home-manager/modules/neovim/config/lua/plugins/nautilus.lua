return {
  -- {
  --   "pwntester/nautilus.nvim",
  --   config = function()
  --     require("nautilus").load({
  --       mode = "brightynauts",
  --       transparent = false,
  --     })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = {
      flavour = "macchiato",
      transparent_background = true,
    },
  },
}
