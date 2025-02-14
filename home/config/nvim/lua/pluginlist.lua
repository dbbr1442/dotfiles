return {
	{
		"rose-pine/neovim",
		priority = 1000,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	{ "williamboman/mason.nvim", enable = false },
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	"neovim/nvim-lspconfig",
}
