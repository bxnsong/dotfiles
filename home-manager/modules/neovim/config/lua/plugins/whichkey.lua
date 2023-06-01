return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("octo.nvim") then
      opts.defaults["<leader>o"] = { name = "+octo" }
    end
  end,
}
