-- TODO: Add keys to check for crate versions/features
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
}
