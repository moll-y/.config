return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("lualine.themes.gruvbox")
		local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
		for _, field in ipairs(lualine_modes) do
			if theme[field] and theme[field].c then
				theme[field].c.bg = "none"
			end
		end
		require("lualine").setup({ options = { theme = theme } })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
	end,
}
