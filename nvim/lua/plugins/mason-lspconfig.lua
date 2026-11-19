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
		-- stylua is a formatter (run by conform), not a language server
		automatic_enable = { exclude = { "stylua", "jdtls" } },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
