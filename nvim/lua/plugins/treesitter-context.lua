return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			enable = true,
			separator = "─",
			max_lines = 0,
			trim_scope = "outer",
			mode = "cursor",
			zindex = 20,
			on_attach = nil,
		})
		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
		vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#555555", bg = "none" })
	end,
}
