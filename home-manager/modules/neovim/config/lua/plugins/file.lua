return {
  { "gpanders/editorconfig.nvim", event = { "BufReadPre", "BufNewFile" } },
  { "norcalli/nvim-colorizer.lua", config = true },
  {
    "luukvbaal/nnn.nvim",
    config = {
      picker = {
        cmd = "tmux new-session nnn -Pp",
        style = { border = "rounded" },
        session = "shared",
      },
      replace_netrw = "picker",
    },
    keys = { { "-", "<cmd>NnnPicker %:p<cr>", desc = "Open nnn" } },
  },
}
