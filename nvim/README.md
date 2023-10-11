```
return {
    "github_user/github_repo",
    dependencies = {              -- this is optional dependencies
      { "other_user/other_repo" },
    },
    lazy = bool,
    event = "some_event",
    cmd = { "some_command" },
    keys = {                      -- this is where you define your keymaps 
                                  -- (also optional)
      
    },
    opts = {                      -- here you pass the options you want set 
                                  -- for the plugin and these are passed as 
                                  -- a table to `Plugin.config` which sets
                                  -- up the plugin
    },

    -- here you override the default config 
    -- function of the plugin, if you want to 
    -- achieve a different implementation than
    -- default config
    -- or config = true,

    config = function(_, opts)
        require("some_plugin").setup(opts)       
    end,                                         
}
```

TODO:
- telescope.lua: Other features
- rust-tools.lua: Clean up
- nvim-treesitter.lua: Clean up commented code
- gitsigns.lua: Test different blame formats
- colorscheme.lua: Add different styles to tokyonight. Ex. Moon, Storm
- utils.lua: Refactor
- LSP
    - init.lua: Refactor
    - lsp-utils.lua: Refactor
    - luasnip: Clean up commented code
- CONFIG
    - mappings.lua: Return to previous packer state of keybinds
