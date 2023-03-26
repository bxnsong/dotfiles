local telescope = require 'telescope'
local lga_actions = require 'telescope-live-grep-args.actions'
telescope.setup {
    defaults = {mappings = {i = {["<C-h>"] = "which_key"}}},
    pickers = {find_files = {find_command = {'fd'}}},
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({postfix = ' --iglob '}),
                    ["<C-t>"] = lga_actions.quote_prompt({postfix = ' -t '}),
                    ["<C-d>"] = lga_actions.quote_prompt({
                        postfix = ' discord_app'
                    })
                }
            }
        }
    }
}
telescope.load_extension('fzf')
telescope.load_extension('harpoon')
telescope.load_extension('live_grep_args')
