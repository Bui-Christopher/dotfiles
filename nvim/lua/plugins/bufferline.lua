return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true
                    }
                },
                indicator = {
                    -- Certain themes do not provide underline
                    -- Ex: gruvbox
                    style = "underline",
                },
                show_buffer_close_icons = false,
                separator_style = "thick",
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
        end,
    },
    {
        "ojroques/nvim-bufdel",
        event = "VeryLazy",
        keys = {
            { "<leader>bd", "<cmd>BufDelOthers<cr>", desc = "Delete all other buffers" },
        }
    }
}
