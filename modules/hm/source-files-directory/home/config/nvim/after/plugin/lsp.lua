local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- no mason
require('lspconfig').lua_ls.setup {
    require("neodev").setup(),
    on_attach = on_attach,
    capabilities = capabilities,
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
    },
}

require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = { ["rust_analyzer"] = {
        diagnostics = {
            enable = false
        }
    }}
}

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").nixd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "nixfmt" },
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake "/tmp/NixOS_Home-Manager").nixosConfigurations.hostname.options',
                },
                home_manager = {
                    expr = '(builtins.getFlake "/tmp/NixOS_Home-Manager").homeConfigurations."user@hostname".options',
                },
                flake_parts = {
                    expr = 'let flake = builtins.getFlake ("/tmp/NixOS_Home-Manager"); in flake.debug.options // flake.currentSystem.options',
                },
            },
        },
    },
})

require("lspconfig").cssls.setup({on_attach = on_attach, capabilities = capabilities})
require("lspconfig").html.setup({on_attach = on_attach, capabilities = capabilities})


-- another example
-- ["omnisharp"] = function()
    --     require('lspconfig').omnisharp.setup {
        --         filetypes = { "cs", "vb" },
        --         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
        --         on_attach = on_attach,
        --         capabilities = capabilities,
        --         enable_roslyn_analyzers = true,
        --         analyze_open_documents_only = true,
        --         enable_import_completion = true,
        --     }
        -- end,
        --})
