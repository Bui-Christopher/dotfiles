local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
    install = { colorscheme = { "tokyonight", "gruvbox" } },
    defaults = {
        lazy = false,              -- Always lazy load
        version = false,           -- Always use the latest git commit
    },
    checker = { enabled = false }, -- automatically check for plugin updates
    ui = { border = "rounded" },
    debug = false,
    change_detection = {
        notify = false,
    },

    -- TODO: Understand what performance does
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
