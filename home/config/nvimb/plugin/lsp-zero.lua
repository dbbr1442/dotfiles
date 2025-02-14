require('lsp-zero')
require('lspconfig').intelephense.setup({})

--require('mason').setup({})
--require('mason-lspconfig').setup({
--	-- Replace the language servers listed here 
	-- with the ones you want to install
--	ensure_installed = {'lua_ls', 'rust_analyzer', 'clangd'},
--	handlers = {
--		function(server_name)
--			require('lspconfig')[server_name].setup({})
--		end,
--	},
--
--})

require("lspconfig").clangd.setup({
    cmd = {
        "clangd", "--header-insertion=never"
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
require("lspconfig").gdscript.setup(capabilities)
