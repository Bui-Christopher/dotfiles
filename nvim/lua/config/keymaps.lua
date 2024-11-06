-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------
-- Normal --
------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Clear Search
keymap("n", "<leader><BS>", ":noh<return><esc>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Open Nvim-Tree File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", ",", "@q", opts)
------------
-- Visual --
------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep most recent paste in register
keymap("v", "p", '"_dP', opts)

------------------
-- Visual Block --
------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-----------------
-- Diagnostics --
-----------------
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-------------------
-- LSP-on-Attach --
-------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local buff = { buffer = args.buf }
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        vim.bo[buff.buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buff)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buff)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buff)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, buff)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, buff)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, buff)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, buff)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, buff)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, buff)
    end,
})
