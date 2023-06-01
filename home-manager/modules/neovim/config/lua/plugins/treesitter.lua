local is_big_file = function(lang, buf)
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.treesitter.language.register("markdown", "octo")
    end,
    opts = {
      highlight = { enable = true, disable = is_big_file },
      indent = { enable = true, disable = is_big_file },
      context_commentstring = { enable = true, disable = is_big_file, enable_autocmd = false },
      incremental_selection = {
        enable = true,
        disable = is_big_file,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
