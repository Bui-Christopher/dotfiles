return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>dv", "<cmd>set hidden<cr><cmd>DiffviewOpen<cr><cmd>set nohidden<cr>" },
        { "<leader>dV", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>" },
    },
    opts = {},
}
