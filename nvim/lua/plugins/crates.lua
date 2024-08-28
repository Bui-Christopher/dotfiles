local opts = { silent = true }

return {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    opts = {
        popup = {
            autofocus = true,
            -- hide_on_select = true, -- Not sure if better on/off
            show_version_date = true,
        },
        lsp = {
            enabled = true,
            completion = true,
            hover = true,
        },
        completion = {
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
            desc = "Show Dependencies",
        },
        {
            "<leader>cf",
            function() require("crates").show_features_popup(opts) end,
            desc = "Show Features",
        },
        {
            "<leader>cv",
            function() require("crates").show_versions_popup(opts) end,
            desc = "Show Versions",
        },

        -- Updating Crates
        {
            "<leader>cu",
            function() require("crates").update_crate(opts) end,
            desc = "Update Crate",
        },
        {
            "<leader>cA",
            function() require("crates").upgrade_all_crates(opts) end,
            desc = "Update All Crates",
        },

        -- External Pages
        {
            "<leader>cC",
            function() require("crates").open_crates_io(opts) end,
            desc = "Open crates.io",
        },
        {
            "<leader>cD",
            function() require("crates").open_documentation(opts) end,
            desc = "Open Documentation",
        },
        {
            "<leader>cH",
            function() require("crates").open_homepage(opts) end,
            desc = "Open Homepage",
        },
        {
            "<leader>cR",
            function() require("crates").open_repository(opts) end,
            desc = "Open Repository",
        },
    }
}
