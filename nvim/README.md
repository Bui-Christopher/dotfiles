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
- Add notes for fugitive
- Clean up
    - `nvim-cmp.lua`
    - `autocmds.lua`
- Practice
    - `nvim-ufo` (folding)
    - LSP keymappings
- gitsigns.lua: Test different blame formats
- Add `nvim-cmp` to `crates.lua`
- `trim.nvim` remove/detect trailing spaces
