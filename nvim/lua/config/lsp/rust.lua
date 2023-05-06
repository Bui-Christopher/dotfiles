local on_attach = function(client)
    require'completion'.on_attach(client)
end

require("rust-tools").setup({
    tools = {
        inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = true,
    },
    on_initialized = function()
      -- ih.set_all()
    end,
    },

    server = {
        settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
             },
             procMacro = {
                enable = true,
             },
             checkOnSave = {
                 command = "clippy",
             }
         }
     }
 },
})
