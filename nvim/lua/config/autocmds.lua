-- Create an autocmd group with a given name and clear existing autocmds
local function create_autocmd(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = create_autocmd("checktime"),
    command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = create_autocmd("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Set .txt as Markdown
vim.api.nvim_create_autocmd("BufEnter", {
    group = create_autocmd("txt_as_md"),
    pattern = {
        "*.txt",
    },
    command = "set filetype=markdown",
})

-- Match Window Split Resizes
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = create_autocmd("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Close Filetypes With <q>
vim.api.nvim_create_autocmd("FileType", {
    group = create_autocmd("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Go to the last location (line and column) when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = create_autocmd("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Format on save (Rust files)
local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.rs", "*.cpp", "*.lua", "*.py" },
    callback = function()
        vim.lsp.buf.format({ timeout_ms = 200 })
    end,
    group = format_sync_grp,
})

-- Wrap/Spell Check in Text Filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = create_autocmd("wrap_spell"),
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
