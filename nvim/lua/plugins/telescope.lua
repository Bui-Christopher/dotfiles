return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    event = "BufReadPre",
    keys = {
        {
            "<leader>fd",
            function() require("telescope.builtin").diagnostics({}) end,
            desc = "Diagnostics",
        },
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files({}) end,
            desc = "Find Plugin File",
        },
        {
            "<leader>fg",
            function() require("telescope.builtin").live_grep({}) end,
            desc = "Live Grep",
        },
        {
            "<leader>fw",
            function() require("telescope.builtin").grep_string({}) end,
            desc = "Grep String",
        },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            }
        }
        require('telescope').load_extension("ui-select")
    end,
}
