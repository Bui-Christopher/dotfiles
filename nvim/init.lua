-- Todo: SORT
vim.opt.laststatus= 1           -- Testing/Playing with and seeing if preferred

vim.opt.number = true

-- New Windows
vim.opt.splitbelow = true       -- New below
vim.opt.splitright = true       -- New right

-- Searching
vim.opt.showmatch = true        -- Show matching braces ([{}])
vim.opt.ignorecase = true       -- Case insensitive search
vim.opt.hlsearch = true         -- Highlight all pattern matching
vim.opt.incsearch = true        -- Incremental search

-- Indenting
vim.opt.autoindent = true       -- Use identation of the previous line
vim.opt.tabstop = 4             -- Affect how tab text is displayed 
vim.opt.softtabstop = 4
vim.opt.expandtab = true        -- Tabbing in insert mode
vim.opt.shiftwidth = 4          -- How much to indent

-- Command Line Completion
vim.opt.wildmenu = true 
vim.opt.wildmode = "longest,list:full"

-- Auto Complete
vim.o.completeopt = "menuone,noinsert,noselect" 
vim.opt.shortmess = vim.opt.shortmess + "c"             -- Avoid Shoring extra messages when using completion

-- Completion Plugin Setup
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
})


-- Plugins
require('plugins')

local lspconfig = require'lspconfig'
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      rustfmt = {
        extraArgs = { "+nightly", },
      },
    }
  }
}

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
