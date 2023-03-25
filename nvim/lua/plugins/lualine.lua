local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"Isrothy/lualine-diagnostic-message",
	},
	config = {
		options = {
			theme = "catppuccin",
			globalstatus = true,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icons_enabled = true,
					padding = 2,
				},
			},
			lualine_b = {
				{
					"filename",
					separator = "|",
				},
				"diagnostics",
			},
			lualine_c = {
				"diagnostic-message",
			},
			lualine_x = {},
			lualine_y = {
				{
					"progress",
					separator = "|",
				},
				{
					"location",
					separator = "|",
				},
				"filesize",
			},
			lualine_z = {
				{
					"filetype",
					padding = 2,
				},
			},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = { "quickfix" },
	},
}

return M
