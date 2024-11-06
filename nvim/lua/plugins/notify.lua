return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader><leader>",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss all Notifications",
        },
    }
}
