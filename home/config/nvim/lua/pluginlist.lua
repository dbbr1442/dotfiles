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

    { "hrsh7th/nvim-cmp", dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets", "hrsh7th/cmp-nvim-lsp" } },

    "folke/neodev.nvim",

    "nvim-telescope/telescope.nvim"
}
