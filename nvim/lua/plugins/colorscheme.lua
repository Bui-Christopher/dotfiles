-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         style = "night",
--     },
--     config = function(_, opts)
--         local tokyonight = require("tokyonight")
--         tokyonight.setup(opts)
--         tokyonight.load()
--     end,
-- }

return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        local gruvbox = require("gruvbox")
        gruvbox.setup(opts)
        gruvbox.load()
    end,
}

-- return {
--     "rebelot/kanagawa.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function(_, opts)
--         local kanagawa = require("kanagawa")
--         kanagawa.setup(opts)
--         kanagawa.load("wave")
--     end,
-- }
