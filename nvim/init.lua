vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.linebreak = true -- wrap at word boundaries, not mid-word
-- On wrapped lines, j/k move by screen line (with a count, like 5j, they still move by real line)
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.winborder = "rounded" -- border on every popup (K docs, errors, signature help)
vim.opt.signcolumn = "yes"
vim.opt.ruler = true
vim.opt.showmode = false -- lualine already shows the mode; hides "-- INSERT --" below it
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
require("config.tabline")

-- Tabs + terminals (Claude): switch tabs with Ctrl-h / Ctrl-l, also while typing in a terminal.
-- (The Backspace key sends a different code than Ctrl-h, so Backspace still works.)
vim.keymap.set({ "n", "t" }, "<C-h>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
-- Entering a terminal puts you straight into typing mode (no need to press i)
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = "term://*",
	command = "startinsert",
})
