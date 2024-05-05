return {
    "cappyzawa/trim.nvim",
    event = "VeryLazy",
    opts = {
        highlight = true
    },
    config = function(_, opts)
        require("trim").setup(opts)
    end,
}
