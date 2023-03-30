local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", ";", ":")
map("n", "H", "^", { desc = "Go to start of line" })
map("n", "L", "$", { desc = "Go to end of line" })
map("i", "jk", "<C-c>", { desc = "Exit insert mode" })
map("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>-", "<cmd>split<CR>", { desc = "Split horizontally" })
