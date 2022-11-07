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
nmap('j', 'gj')
nmap('k', 'gk')
nmap('-', '<cmd>NnnPicker %:p:h<CR>')
nmap('<leader>\\', '<cmd>vsplit<CR>')
nmap('<leader>-', '<cmd>split<CR>')
nmap('<C-l>', '<C-w>l')
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<BS>', '<C-^>')
nmap('<ESC>', ':noh<CR>')

-- which-key
local wk = require 'which-key'
wk.register({
    x = {
        name = 'Trouble',
        x = { '<cmd>TroubleToggle<CR>', 'Toggle' },
        d = { '<cmd>Trouble document_diagnostics<CR>', 'Diagnostics' },
        a = { '<cmd>Trouble lsp_definitions<CR>', 'LSP definitions' },
        t = { '<cmd>Trouble lsp_type_definitions<CR>', 'LSP type definitions' },
        r = { '<cmd>Trouble lsp_references<CR>', 'LSP references' },
    },
    t = {
        name = 'Telescope',
        f = { '<cmd>Telescope find_files hidden=true<CR>', 'Find files' },
        g = { '<cmd>Telescope live_grep<CR>', 'Grep' },
        b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
        h = { '<cmd>Telescope harpoon marks<CR>', 'Marks' },
    },
    h = {
        name = 'Harpoon',
        a = { '<cmd>lua require"harpoon.mark".add_file()<CR>', 'Add file' }
    }
}, { prefix = '<leader>' })
