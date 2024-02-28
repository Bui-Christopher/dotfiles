return {
    'numToStr/Comment.nvim',
    event = "BufReadPre",
    opts = {
        mappings = {
            basic = true,
            extra = true,
        },
        toggler = {
            line = 'gcc',
            block = 'gbc',
        },
    },
}
