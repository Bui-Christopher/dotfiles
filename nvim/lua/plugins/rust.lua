return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                -- test_executor = "neotest",
                hover_actions = {
                    auto_focus = true,
                },
            },
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            -- allFeatures = true,
                            -- features = { "all" },
                            -- loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        checkOnSave = {
                            -- allFeatures = true,
                            -- features = { "all" },
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        rustfmt = {
                            extraArgs = { "+nightly" },
                        },
                        procMacro = {
                            enable = true,
                            -- ignored = {
                            --     leptos_macro = {
                            --         "component",
                            --         "server",
                            --     },
                            -- },
                        },
                    },
                },
            },
        }
    end
}
