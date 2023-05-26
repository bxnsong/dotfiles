return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    config = {
      defaults = {
        mappings = {
          i = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
        },
        preview = {
          filesize_hook = function(filepath, bufnr, opts)
            local max_bytes = 5000
            local cmd = { "head", "-c", max_bytes, filepath }
            require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
          end,
        },
      },
    },
    keys = { { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find Files" } },
  },
}
