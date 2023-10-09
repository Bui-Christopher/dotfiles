local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufReadPre",
	dependencies = {
        { "nvim-lua/plenary.nvim" }, -- TODO: Custom added, is there a better way like misc.lua?
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},  
    keys = {
    -- disable the keymap to grep files
    {"<leader>/", false},
    -- change a keymap
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
  },
}

return M
