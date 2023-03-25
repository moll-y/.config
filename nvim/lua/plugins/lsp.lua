local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}

function M.config()
	require("mason").setup({
		ui = {
			icons = {
				package_pending = "➜",
				package_installed = "✓",
				package_uninstalled = "✗",
			},
		},
	})

	require("mason-lspconfig").setup({
		automatic_installation = true,
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- require("lspconfig").setup({})
	require("lspconfig").rust_analyzer.setup({
		capabilities = capabilities,
	})

	require("lspconfig").tsserver.setup({
		capabilities = capabilities,
	})

	require("lspconfig").csharp_ls.setup({
		capabilities = capabilities,
	})

	require("lspconfig").clangd.setup({
		capabilities = capabilities,
	})
end

return M
