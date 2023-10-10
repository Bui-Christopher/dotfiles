-- TODO: Understand key_mapping configs
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
        { "nvim-lua/plenary.nvim" }, -- TODO: Custom added, is there a better way like misc.lua?
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	event = "BufReadPre",
    keys = {
        -- disable the keymap to grep files
        { "<leader>/", false },
        {
          "<leader>ff",
          function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
          desc = "Find Plugin File",
        },
    },
}
