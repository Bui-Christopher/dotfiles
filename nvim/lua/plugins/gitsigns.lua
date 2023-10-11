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
        -- TODO: Play with blame formatter
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        -- TODO: Find out whether border = "rounded" or "minimal" is preferred
        preview_config = {
            -- Options passed to nvim_open_win
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    },
}
