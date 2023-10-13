return {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    -- lazy = false,
    opts = {
        mappings = {
            basic = true,
            extra = true,
        },
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc',
        },
    },
}
