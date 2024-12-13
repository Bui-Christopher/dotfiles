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
                enable_clippy = true,
                hover_actions = {
                    auto_focus = true,
                },
            },
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        -- cargo = {
                        --     features = { "wasm" },
                        -- },
                        -- rustc = {
                        --     source = "discover",
                        -- },
                        rustfmt = {
                            extraArgs = { "+nightly" },
                        },
                    },
                },
            },
        }
    end
}
