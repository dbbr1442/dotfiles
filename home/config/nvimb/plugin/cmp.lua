local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end, {"i","s","c",}),

        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Esc>'] = cmp.mapping.abort(),

        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    --[[mapping = {
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Esc>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.complete(),
    },]]
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    mapping = {
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ['<Esc>'] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
        ["<Tab>"] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
        { name = 'path' },
        { name = "cmdline" },
    })
})
