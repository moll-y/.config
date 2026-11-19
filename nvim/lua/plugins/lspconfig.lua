-- Servers are installed by mason and enabled by mason-lspconfig (see mason-lspconfig.lua).
-- This file only holds shared settings and per-server overrides.
return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
			severity_sort = true,
		})

		vim.lsp.config("*", {
			capabilities = {
				workspace = { fileOperations = { didRename = true, willRename = true } },
			},
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					hint = { enable = true },
				},
			},
		})

		vim.lsp.inlay_hint.enable(true)
	end,
}
