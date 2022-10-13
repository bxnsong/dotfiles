vim.g.mapleader = ' '

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

nmap(';', ':')
nmap('H', '^')
nmap('L', '$')
imap('jk', '<C-c>')
nmap('-', '<cmd>NnnPicker %:p:h<CR>')
nmap('<leader>\\', '<cmd>vsplit<CR>')
nmap('<leader>-', '<cmd>split<CR>')
nmap('<C-l>', '<C-w>l')
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<BS>', '<C-^>')
nmap('<ESC>', ':noh<CR>')

-- Telescope mappings
nmap('<leader>tf', '<cmd>Telescope find_files hidden=true<CR>')
nmap('<leader>tg', '<cmd>Telescope live_grep<CR>')
nmap('<leader>tb', '<cmd>Telescope buffers<CR>')
