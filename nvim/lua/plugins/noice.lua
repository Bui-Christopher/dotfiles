return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        --   `nvim-notify` is only needed, if you want to use the notification view.
        "rcarriga/nvim-notify",
    },
    config = true,
}
