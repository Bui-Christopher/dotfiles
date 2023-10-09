-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local M = {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        -- cmd = { 'NvimTreeOpen', 'NvimTreeFindFileToggle' },
        -- event = 'VeryLazy',
        config = function()
            local opts = { noremap = true, silent = true }

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                on_attach = my_on_attach,
                view = {
                    adaptive_size = true,
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
                diagnostics = {
                    enable = true,
                }
            })
        end
    },
}

return M

-- TODO: Test and understand
-- local M = {
--     "nvim-tree/nvim-tree.lua",
--     dependencies = {"nvim-tree/nvim-web-devicons"},
--     cmd = "NvimTreeToggle",
--     config = true,
-- 
--    require("nvim-tree").setup({
--        sort_by = "case_sensitive",
--        renderer = {
--            group_empty = true,
--        },
--        filters = {
--            dotfiles = true,
--        },
--        diagnostics = {
--            enable = true,
--        }
--    })
-- }
