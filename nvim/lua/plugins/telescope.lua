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
        {
            "<leader>fd",
            function() require("telescope.builtin").diagnostics({}) end,
            desc = "Diagnostics",
        },
    }
}
-- TODO: Examine again
-- builtin.lsp_references
-- builtin.lsp_incoming_calls
-- builtin.lsp_outgoing_calls
-- builtin.lsp_implementations
-- builtin.lsp_definitions
-- builtin.lsp_type_definitions
