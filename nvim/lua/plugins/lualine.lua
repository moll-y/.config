-- Status bar: lualine's filled blocks and arrow ends, with my colors. The mode block changes
-- color with the mode (normal cyan, insert pink, visual yellow, command white, replace red);
-- everything after it is transparent, with cyan bold » / « between the parts.
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local black, light, dim = "#000000", "#c8d3f5", "#828bb8"
		local yellow = "#ffc107" -- the yellow of Claude Code's "auto mode on"
		local function mode(color)
			return {
				a = { fg = black, bg = color, gui = "bold" },
				b = { fg = light, bg = "NONE" },
				c = { fg = "#00cccc", bg = "NONE", gui = "bold" }, -- cyan bold: the » / « separators take this color
				z = { fg = "#ffffff", bg = "#ff4365" }, -- line:col block, always pink
			}
		end
		local theme = {
			normal = mode("#00cccc"),
			insert = mode("#ff4365"),
			visual = mode("#ffc777"),
			command = mode("#ffffff"),
			replace = mode("#ff757f"),
			terminal = mode("#00cccc"),
			inactive = mode(dim),
		}

		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = { left = "»", right = "«" },
				-- one status bar for the whole screen; while the file tree is focused it keeps showing the file
				globalstatus = true,
				ignore_focus = { "NvimTree" },
			},
			sections = {
				lualine_a = { { "mode", fmt = string.lower } }, -- "normal", "insert", ... in lowercase
				-- one section per side, so only » / « separate the parts (lualine puts an arrow between sections)
				lualine_b = {},
				lualine_c = {
					{ "branch", color = { fg = dim } },
					"diff",
					{
						"diagnostics",
						-- same look as the git diff counts (+2 ~1 -1): symbol stuck to the number, no icons
						symbols = { error = "", warn = "!", info = "i", hint = "?" }, -- errors: just the red number
						diagnostics_color = {
							error = { fg = "#ff0000" },
							warn = { fg = yellow },
							info = { fg = "#00cccc" },
							hint = { fg = "#c3e88d" },
						},
					},
					{
						"filename",
						color = { fg = "#ffffff" },
						fmt = function(name)
							return (name:gsub("^claude%-prompt%-.*", "claude prompt"))
						end,
					},
				},
				lualine_x = {
					{ "encoding", color = { fg = "#ffffff" } },
					{ "fileformat", color = { fg = "#ffffff" } }, -- the penguin (unix line endings)
					{ "filetype", color = { fg = dim } },
					{ "%p%%", color = { fg = dim } }, -- always a percentage (no "Top"/"Bot")
				},
				lualine_y = {},
			},
		})
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
	end,
}
