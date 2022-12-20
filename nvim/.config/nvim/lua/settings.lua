vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('colorscheme tokyonight-night')

vim.o.encoding = 'utf-8'
vim.o.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
vim.o.completeopt = 'menuone,noselect'
vim.o.startofline = true

vim.o.showmatch = true -- show matching brackets
vim.o.scrolloff = 4 -- show 4 rows from edge of screen
vim.o.laststatus = 2 -- always show status line

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4 -- tab is 4 spaces
vim.o.shiftwidth = 4 -- indentation rule
vim.o.expandtab = true -- convert tabs to spaces
vim.o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word

vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insensitive unless capitals used in search

vim.o.clipboard = 'unnamed' -- make clipboard work on mac

require('settings.autopairs')
require('settings.cmp')
require('settings.oscyank')
require('settings.rnvimr')
require('settings.telescope')
require('settings.treesitter')
