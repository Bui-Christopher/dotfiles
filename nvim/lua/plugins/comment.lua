local M = {
    'numToStr/Comment.nvim',
    lazy = false,
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
return M
