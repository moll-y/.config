return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			keywords = { bold = true },
			functions = { bold = true },
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51b3ec", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#fb508f", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })

		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" }) -- Background behind the tabs
		vim.api.nvim_set_hl(0, "TabLine", { bg = "none" }) -- Inactive tabs
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none", bold = true }) -- Selected tab
	end,
}
