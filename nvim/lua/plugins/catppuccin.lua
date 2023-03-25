--[[
  Colorscheme plugin
]]
--

local M = {
	"catppuccin/nvim",
	name = "catppuccin",

	-- Make sure we load this during startup if it is your main colorscheme
	lazy = false,

	-- Make sure to load this before all the other start plugins
	priority = 1000,

	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}

function M.config()
	require("catppuccin").setup({
		transparent_background = true,
	})

	vim.cmd.colorscheme("catppuccin")
end

return M
