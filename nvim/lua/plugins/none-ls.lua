return {
    "nvimtools/none-ls.nvim",
    -- optional = true,
    dependencies = { "mason.nvim" },
    opts = {},
    config = function(_, opts)
        local null_ls = require("null-ls")
        require("null-ls").setup({
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.pylint.with({
                    extra_args = { "--disable=C0111" }, -- Disable missing-class-docstring warning
                }),
                null_ls.builtins.diagnostics.eslint,
            }
        })
    end,
}
