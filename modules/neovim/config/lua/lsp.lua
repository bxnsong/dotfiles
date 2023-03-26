-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
})
require'lspconfig'.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {pylsp = {plugins = {pycodestyle = {enabled = false}}}}
})
require 'lspconfig'.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
})
require 'lspconfig'.rnix.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
})
