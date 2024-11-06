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
                hover_actions = {
                    auto_focus = true,
                },
            },
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            -- features = { "all" },
                            runBuildScripts = true,
                        },
                        checkOnSave = { command = "clippy" },
                        rustfmt = {
                            extraArgs = { "+nightly" },
                        },
                        -- For Leptos
                        -- procMacro = {
                        --     ignored = {
                        --         leptos_macro = {
                        --             -- "component",
                        --             -- "server",
                        --         },
                        --     },
                        -- },
                    },
                },
            },
        }
    end
}
