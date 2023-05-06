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
        on_attach = on_attach,
        -- on_attach = function(_, bufnr)
        --     -- Hover actions
        --     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        --     -- Code action groups
        --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        -- end,

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
                -- rustfmt = {
                --     extraArgs = { "+nightly" },
                -- }
            }
        }
    },
})
