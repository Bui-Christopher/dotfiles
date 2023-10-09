local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		local colors = require("utils").git_colors
		return {
			style = "moon",
			-- hide_inactive_statusline = true,
			on_highlights = function(hl, c)
				hl.GitSignsAdd = {
					fg = colors.GitAdd,
				}
				hl.GitSignsChange = {
					fg = colors.GitChange,
				}
				hl.GitSignsDelete = {
					fg = colors.GitDelete,
				}
			end,
		}
	end,
	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		tokyonight.load()
	end,
}

return M

-- local M = {
--     "ellisonleao/gruvbox.nvim",
--     lazy = false,
--     priority = 1000,
--  	config = function(_, opts)
--  		local gruvbox = require("gruvbox")
--  		gruvbox.setup(opts)
--  		gruvbox.load()
--  	end,
-- }
-- return M
