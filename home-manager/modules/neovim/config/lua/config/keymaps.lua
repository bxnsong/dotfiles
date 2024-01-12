-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", ";", ":")
vim.keymap.set({ "n", "x" }, "H", "^", { desc = "Go to start of line" })
vim.keymap.set({ "n", "x" }, "L", "$", { desc = "Go to end of line" })
vim.keymap.set("i", "jk", "<C-c>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Split horizontally" })

vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameCopyCommitURL<CR>", { desc = "Copy Git blame URL" })
