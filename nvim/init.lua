vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.ruler = true
vim.opt.list = true
vim.opt.fillchars = {
	stl = " ",
	stlnc = " ",
	vert = "│",
	fold = " ",
	diff = "╱",
	msgsep = "─",
	eob = "↴",
}
vim.opt.listchars = {
	tab = "│ ",
	nbsp = "␣",
	extends = "·",
	precedes = "·",
	eol = "↴",
	space = "⋅",
}
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "json" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
	end,
})

require("config.lazy")
