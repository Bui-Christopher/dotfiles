return require('packer').startup(function(use)
    -- Package Manager
    use 'wbthomason/packer.nvim'

    -- Common Configs for nvim LSP
    use 'neovim/nvim-lspconfig' 

    -- Fidget Spinner for LSP
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    })

    -- Auto Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
    use("hrsh7th/nvim-cmp")
    
    -- Syntax Tree 
    use 'nvim-treesitter/nvim-treesitter'

    -- Languages
    use 'simrat39/rust-tools.nvim'

    -- Themes
    use { "ellisonleao/gruvbox.nvim" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
end)
