return {
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
  { "f-person/git-blame.nvim" },
  { "sindrets/diffview.nvim", dependencies = { "plenary.nvim" } },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
}
