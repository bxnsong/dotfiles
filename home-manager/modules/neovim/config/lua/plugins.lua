local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use { 'williamboman/mason.nvim', config = function() require 'mason'.setup() end }

    use { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim',
        config = function() require 'mason-lspconfig'.setup() end }

    use { 'neovim/nvim-lspconfig' }

    use { 'jose-elias-alvarez/null-ls.nvim', config = function() require 'null-ls'.setup({
            -- you can reuse a shared lspconfig on_attach callback here
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                filter = function(client)
                                    return client.name == 'null-ls'
                                end
                            })
                        end,
                    })
                end
            end,
            sources = {
                require 'null-ls'.builtins.formatting.prettierd.with({
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/discord/.prettierrc')
                    }
                }),
                require 'null-ls'.builtins.code_actions.eslint_d,
                require 'null-ls'.builtins.diagnostics.eslint_d,
                require 'null-ls'.builtins.formatting.black,
                require 'null-ls'.builtins.diagnostics.flake8,
                require 'null-ls'.builtins.formatting.ktlint,
                require 'null-ls'.builtins.diagnostics.ktlint,
                require 'null-ls'.builtins.formatting.stylua,
                require 'null-ls'.builtins.diagnostics.luacheck,
                require 'null-ls'.builtins.formatting.nixfmt,
            },
        })
    end, requires = { { 'nvim-lua/plenary.nvim' } }, after = 'mason.nvim' }

    use 'neovim/nvim-lspconfig'

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require'null-ls'.setup({
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                vim.lsp.buf.format({
                                    bufnr = bufnr,
                                    filter = function(client)
                                        return client.name == 'null-ls'
                                    end
                                })
                            end
                        })
                    end
                end,
                sources = {
                    require'null-ls'.builtins.formatting.prettierd.with({
                        env = {
                            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand(
                                '~/discord/.prettierrc')
                        }
                    }), require'null-ls'.builtins.code_actions.eslint_d,
                    require'null-ls'.builtins.diagnostics.eslint_d,
                    require'null-ls'.builtins.formatting.black,
                    require'null-ls'.builtins.diagnostics.flake8,
                    require'null-ls'.builtins.formatting.ktlint,
                    require'null-ls'.builtins.diagnostics.ktlint,
                    require'null-ls'.builtins.formatting.lua_format,
                    require'null-ls'.builtins.diagnostics.luacheck
                }
            })
        end,
        requires = 'nvim-lua/plenary.nvim',
        after = 'mason.nvim'
    }

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'trouble'.setup {} end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim'
        }
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use({
        'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help', 'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path', 'onsails/lspkind.nvim'
    })

    use {
        'ggandor/leap.nvim',
        config = function() require'leap'.set_default_keymaps() end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use 'gpanders/editorconfig.nvim'

    use {
        'AckslD/nvim-trevJ.lua',
        config = 'require"trevj".setup()', -- optional call for configurating non-default filetypes etc

        -- uncomment if you want to lazy load
        module = 'trevj',

        -- an example for configuring a keybind, can also be done by filetype
        setup = function()
            vim.keymap.set('n', '<leader>j',
                           function()
                require('trevj').format_at_cursor()
            end)
        end
    }

    use 'kevinhwang91/rnvimr'

    use 'folke/tokyonight.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function() require'Comment'.setup() end
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require'nvim-autopairs'.setup {} end
    }

    use {
        'kylechui/nvim-surround',
        config = function() require'nvim-surround'.setup {} end
    }

    use {
        'datwaft/bubbly.nvim',
        config = function()
            -- Here you can add the configuration for the plugin
            vim.g.bubbly_palette = {
                background = "#34343c",
                foreground = "#c5cdd9",
                black = "#3e4249",
                red = "#ec7279",
                green = "#a0c980",
                yellow = "#deb974",
                blue = "#6cb6eb",
                purple = "#d38aea",
                cyan = "#5dbbc1",
                white = "#c5cdd9",
                lightgrey = "#57595e",
                darkgrey = "#404247"
            }
            vim.g.bubbly_statusline = {
                'mode', 'truncate', 'path', 'branch', 'signify', 'gitsigns',
                'coc', 'divisor', 'filetype', 'progress'
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require'gitsigns'.setup() end
    }

    use {
        'ruifm/gitlinker.nvim',
        after = 'vim-oscyank',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require'gitlinker'.setup {
                opts = {
                    action_callback = function(url)
                        -- yank to unnamed register
                        vim.api.nvim_command('let @" = \'' .. url .. '\'')
                        -- copy to the system clipboard using OSC52
                        vim.fn.OSCYankString(url)
                    end
                }
            }
        end
    }

    use {'ojroques/vim-oscyank', branch = 'main'}

    use {'f-person/git-blame.nvim'}

    use {
        'ldelossa/gh.nvim',
        requires = 'ldelossa/litee.nvim',
        config = function()
            require'litee.lib'.setup()
            require'litee.gh'.setup()
        end
    }

    use {
        'ThePrimeagen/harpoon',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require'harpoon'.setup {mark_branch = true} end
    }

    use {
        'folke/which-key.nvim',
        config = function() require'which-key'.setup() end
    }

    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}

    if packer_bootstrap then require'packer'.sync() end
end)
