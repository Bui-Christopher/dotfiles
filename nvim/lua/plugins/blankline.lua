return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
        indent = {
            char = "│",
            tab_char = "▸", -- Clearly signify a tab
        },
        scope = { enabled = false },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
    end
}
