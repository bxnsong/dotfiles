return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use { 'williamboman/mason.nvim', config = function() require'mason'.setup() end }

    use { 'williamboman/mason-lspconfig.nvim', after = 'mason', config = function() require'mason-lspconfig'.setup() end }

    use { 'neovim/nvim-lspconfig', after = 'mason-lspconfig' }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use { 'ms-jpq/coq.nvim', branch = 'coq' }

    use 'ggandor/lightspeed.nvim'

    use {
        'AckslD/nvim-revJ.lua',
        requires = { 'wellle/targets.vim' },
        config = function() require'revj'.setup {
            keymaps = {
                operator = '<Leader>J',
                line = '<Leader>j',
                visual = '<Leader>j',
            }
        } end
    }

    use { 'luukvbaal/nnn.nvim', config = function() require'nnn'.setup {
        replace_netrw = 'picker',
    } end}

    use 'folke/tokyonight.nvim'

    use { 'numToStr/Comment.nvim', config = function() require'Comment'.setup() end }

    use { 'steelsojka/pears.nvim', config = function() require'pears'.setup() end }

    use {'datwaft/bubbly.nvim', config = function()
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
      darkgrey = "#404247",
    }
    vim.g.bubbly_statusline = {
      'mode',

      'truncate',

      'path',
      'branch',
      'signify',
      'gitsigns',
      'coc',

      'divisor',

      'filetype',
      'progress',
    }
  end}

end)
