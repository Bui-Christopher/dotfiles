return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    keys = {
        { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Markdown Preview"},

    },
    build = function() vim.fn["mkdp#util#install"]() end
}
