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
nmap('<leader>f', '<cmd>Telescope find_files<CR>')
nmap('-', '<cmd>NnnPicker %:p:h<CR>')
nmap('<leader>\\', '<cmd>vsplit<CR>')
nmap('<leader>-', '<cmd>split<CR>')
nmap('<C-l>', '<C-w>l')
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<BS>', '<C-^>')
nmap('<ESC>', ':noh<CR>')
