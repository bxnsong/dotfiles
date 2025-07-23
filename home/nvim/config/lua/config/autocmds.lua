-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

function DiffColours()
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#25274c", reverse = false })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#223342", reverse = false })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#362433", reverse = false })
  vim.api.nvim_set_hl(0, "DiffviewAddAsDelete", { bg = "#362433", reverse = false })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#38396f", reverse = false })
  vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = "#161d2d", reverse = false })
end

DiffColours()
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "calvera" },
  callback = DiffColours,
})
