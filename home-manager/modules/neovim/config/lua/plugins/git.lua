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
  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_ignored_filetypes = { "octo" }
    end,
  },
  { "sindrets/diffview.nvim", dependencies = { "plenary.nvim" } },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    cmd = "Octo",
    keys = {
      { "<leader>op", "<cmd>Octo pr search review-requested:@me is:open<cr>", desc = "View my PR queue" },
      { "<leader>om", "<cmd>Octo pr search author:@me<cr>", desc = "View my open PRs" },
      { "<leader>oc", "<cmd>Octo pr changes<cr>", desc = "View current PR changes" },
    },
  },
}
