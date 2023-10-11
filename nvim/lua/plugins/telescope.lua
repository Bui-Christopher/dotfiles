-- TODO: What about features of telescope?
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
        { "nvim-lua/plenary.nvim" },
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
