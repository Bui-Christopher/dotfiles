return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 0000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%m-%d-%Y> - <summary>",
        preview_config = {
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 3,
        },
    },
    keys = {
        {
            "]g",
            mode = { "n", "v" },
            function() require("gitsigns.actions").next_hunk({}) end,
            desc = "Jump to next git hunk",
        },
        {
            "[g",
            mode = { "n", "v" },
            function() require("gitsigns.actions").prev_hunk({}) end,
            desc = "Jump to prev git hunk",
        },
    }
}
