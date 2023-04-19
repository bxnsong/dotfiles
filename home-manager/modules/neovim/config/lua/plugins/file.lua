return {
  { "gpanders/editorconfig.nvim", event = { "BufReadPre", "BufNewFile" } },
  { "norcalli/nvim-colorizer.lua", config = true },
  { "luukvbaal/nnn.nvim", config = true, keys = { { "-", "<cmd>NnnPicker %:p:h<cr>", desc = "Open nnn" } } },
}
