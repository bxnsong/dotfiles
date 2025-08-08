if not vim.g.vscode then
    return {}
end

return {
    {
        "folke/snacks.nvim",
        opts = {
            lazygit = {
                enabled = false,
            },
        },
    },
}
