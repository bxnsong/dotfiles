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
}
