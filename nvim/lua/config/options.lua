-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"    -- the encoding written to a file

-- Searching
vim.opt.hlsearch = true   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.showmatch = true  -- Show matching braces ([{}])
vim.opt.incsearch = true  -- Incremental search

-- Mouse
vim.opt.mouse = "a" -- allow the mouse to be used in neovim

-- Display
vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false     -- creates a swapfile
vim.opt.pumheight = 10       -- pop up menu height
vim.opt.showmode = false     -- we don't need to see things like -- INSERT -- anymore
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true  -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)

-- Indenting
vim.opt.autoindent = true  -- Use identation of the previous line
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.shiftwidth = 4     -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4        -- insert 2 spaces for a tab
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- make indenting smarter again

-- Number
vim.opt.number = true          -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 2        -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"     -- always show the sign column, otherwise it would shift the text each time

vim.opt.wrap = false           -- display lines as one long line
vim.opt.scrolloff = 8          -- decide when to vertically scroll
vim.opt.sidescrolloff = 8      -- decide when to horizontally scroll

-- Auto Completion
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.shortmess:append "c"
