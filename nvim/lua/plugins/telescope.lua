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
        {
          "<leader>ff",
          function() require("telescope.builtin").find_files({}) end,
          desc = "Find Plugin File",
        },
        {
          "<leader>fg",
          function() require("telescope.builtin").live_grep({}) end,
          desc = "Live Grep",
        },
        {
          "<leader>fb",
          function() require("telescope.builtin").buffers({}) end,
          desc = "Search Buffers",
        },
    },
}
