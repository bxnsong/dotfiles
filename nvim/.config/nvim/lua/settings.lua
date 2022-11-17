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

vim.g.oscyank_silent = true -- don't show oscyank confirmation message after yanking

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}

local telescope = require 'telescope'
local lga_actions = require 'telescope-live-grep-args.actions'
telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            }
        }
    },
    pickers = {
        find_files = { find_command = { 'fd' } }
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = ' --iglob '}),
                    ["<C-t>"] = lga_actions.quote_prompt({ postfix = ' -t '}),
                    ["<C-d>"] = lga_actions.quote_prompt({ postfix = ' discord_app'}),
                }
            }
        }
    }
}
telescope.load_extension('fzf')
telescope.load_extension('harpoon')
telescope.load_extension('live_grep_args')

vim.g.oscyank_term = 'default'

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = false,
        jump_to_mark = '',
        bigger_preview = '',
    },
}
require 'coq'

-- START nvim-autopairs map <CR> --
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
        else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
-- END nvim-autopairs --
