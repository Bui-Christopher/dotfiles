local parsers = { "bash", "c", "cpp", "git_rebase", "gitignore", "go", "json", "lua", "markdown", "python", "rust",
    "yaml" }
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
    },
    opts = {
        ensure_installed = parsers,
        sync_install = true,
        auto_install = true,
        highlight = {
            enable = true,
            disable = function(_, buf)
                local max_filesize = 100 * 1024     -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        -- List of parsers to ignore installation
        -- ignore_install = { "javascript" },

        autopairs = { enable = true },
        refactor = {
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = false },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
