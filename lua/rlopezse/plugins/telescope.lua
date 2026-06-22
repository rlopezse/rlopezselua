return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "dist/",
                    "build/",
                    "coverage/",
                },
            },

            pickers = {
                find_files = {
                    find_command = {
                        "fd",
                        "--type", "f",
                        "--hidden",
                        "--exclude", ".git",
                        "--exclude", "node_modules",
                        "--exclude", "dist",
                        "--exclude", "build",
                        "--exclude", "coverage",
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>sf', builtin.find_files, {
            desc = 'Find Files'
        })

        vim.keymap.set('n', '<leader>sg', builtin.live_grep, {
            desc = 'Live Grep'
        })

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > ")
            })
        end, {
            desc = 'Grep String'
        })
    end,
}
