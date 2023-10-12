-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    cmd = { 'NvimTreeOpen', 'NvimTreeFindFileToggle' },
    lazy = false,
    opts = {
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 500,
        },
        -- Compact folders that only contain a single folder into one node.
        renderer = {
            group_empty = true,
            highlight_git = true,
            highlight_diagnostics = true,
            indent_markers = {
                enable = true,
            }
        },
        filters = {
            git_ignored = true,
            dotfiles = true,
        },
        diagnostics = {
            enable = true,
        }
    },
}
