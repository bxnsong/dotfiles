-- https://github.com/hrsh7th/nvim-cmp
local cmp_ok, cmp = pcall(require, 'cmp')
local cmp_autopair_ok, cmp_autopairs = pcall(require,
                                             'nvim-autopairs.completion.cmp')
local lspkind = require 'lspkind'

vim.opt.completeopt = 'menu,menuone,noselect'

if not cmp_ok then
    return
else
    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                ellipsis_char = '...'
            })
        },
        window = {
            completion = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None'
            },
            documentation = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None'
            }
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-n>'] = {
                c = function(fallback)
                    local cmp = require('cmp')
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end
            },
            ['<C-p>'] = {
                c = function(fallback)
                    local cmp = require('cmp')
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end
            },
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end
        }),
        sources = cmp.config.sources({
            {name = 'nvim_lsp', priority = 5, max_item_count = 5},
            {name = 'buffer', priority = 4, max_item_count = 3},
            {name = 'path', priority = 1, max_item_count = 3},
            {name = 'nvim_lsp_signature_help'}, {name = 'nvim_lua'}
        })
    })
end

-- https://github.com/windwp/nvim-autopairs
local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')

if autopairs_ok then autopairs.setup() end
