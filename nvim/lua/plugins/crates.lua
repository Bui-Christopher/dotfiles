local opts = { silent = true }

return {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    opts = {
        src = {
            cmp = {
                enabled = true,
            }
        }
    },
    keys = {
        -- Crate Management
        {
            "<leader>cd",
            function() require("crates").show_dependencies_popup(opts) end,
        },
        {
            "<leader>cf",
            function() require("crates").show_features_popup(opts) end,
        },
        {
            "<leader>cv",
            function() require("crates").show_versions_popup(opts) end,
        },

        -- Updating Crates
        {
            "<leader>cu",
            function() require("crates").update_crate(opts) end,
        },
        {
            "<leader>cA",
            function() require("crates").upgrade_all_crates(opts) end,
        },

        -- External Pages
        {
            "<leader>cC",
            function() require("crates").open_crates_io(opts) end,
        },
        {
            "<leader>cD",
            function() require("crates").open_documentation(opts) end,
        },
        {
            "<leader>cH",
            function() require("crates").open_homepage(opts) end,
        },
        {
            "<leader>cR",
            function() require("crates").open_repository(opts) end,
        },
    }
}
