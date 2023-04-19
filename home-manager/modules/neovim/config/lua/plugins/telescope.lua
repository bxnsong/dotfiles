return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = { { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find Files" } },
  },
}
