-- -- TODO: Understand this utils.git_colors
-- -- Also, play with config/opts so that we can utilize different styles. (storm, moon)

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
--         function()
-- 		local colors = require("utils").git_colors
-- 		return {
-- 			-- hide_inactive_statusline = true,
-- 			on_highlights = function(hl)
-- 				hl.GitSignsAdd = {
-- 					fg = colors.GitAdd,
-- 				}
-- 				hl.GitSignsChange = {
-- 					fg = colors.GitChange,
-- 				}
-- 				hl.GitSignsDelete = {
-- 					fg = colors.GitDelete,
-- 				}
-- 			end,
-- 		}
--         end,
--         style = "night",
--     },
-- 	config = function(_, opts)
-- 		local tokyonight = require("tokyonight")
-- 		tokyonight.setup(opts)
-- 		tokyonight.load()
-- 	end,
-- }

return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    -- opts = {
    --     transport_mode = true,
    -- },
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
--         require("kanagawa").setup(opts)
--         require("kanagawa").load("wave")
--     end,
-- }
