return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"rust_analyzer",
			"ts_ls",
			"lua_ls",
			"clangd",
			"gopls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
