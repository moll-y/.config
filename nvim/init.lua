--[[
  Init.lua
]]
--
-- Boostrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Global Options
vim.opt.mouse = table.concat({ -- Enable mouse support for normal and visual modes.
	"n", -- Normal mode
	"v", -- Visual mode
})
vim.opt.startofline = true -- Move cursor to the start of each line when jumping with certain commands.
vim.opt.report = 1000 -- Threshold for reporting number of lines changed.
vim.opt.scrolloff = 5 -- Minimum number of screen lines to keep above and below the cursor.
vim.opt.shortmess = table.concat({ -- Use abbreviations and short messages in command menu line.
	"f", -- Use "(3 of 5)" instead of "(file 3 of 5)".
	"i", -- Use "[noeol]" instead of "[Incomplete last line]".
	"l", -- Use "999L, 888C" instead of "999 lines, 888 characters".
	"m", -- Use "[+]" instead of "[Modified]".
	"n", -- Use "[New]" instead of "[New File]".
	"r", -- Use "[RO]" instead of "[readonly]".
	"w", -- Use "[w]", "[a]" instead of "written", "appended".
	"x", -- Use "[dos]", "[unix]", "[mac]" instead of "[dos format]", "[unix format]", "[mac format]".
	"o", -- Overwrite message for writing a file with subsequent message.
	"O", -- Message for reading a file overwrites any previous message.
	"s", -- Disable "search hit BOTTOM, continuing at TOP" such messages.
	"t", -- Truncate file message at the start if it is too long.
	"T", -- Truncate other messages in the middle if they are too long.
	"I", -- Don't give the :intro message when starting.
	"c", -- Don't give ins-completion-menu messages.
	"F", -- Don't give the file info when editing a file.
})
vim.opt.sidescroll = 5 -- Columns to scroll horizontally when cursor is moved off the screen.
vim.opt.sidescrolloff = 5 -- Minimum number of screen columns to keep to cursor right.
vim.opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete.
vim.opt.updatetime = 500 -- Trigger CursorHold event faster.
vim.opt.diffopt = { -- Option settings for diff mode.
	"filler", -- Show filler lines.
	"vertical", -- Start diff mode with vertical splits.
	"hiddenoff", -- Do not use diff mode for a buffer when it becomes hidden.
	"foldcolumn:0", -- Set the 'foldcolumn' option to 0.
	"algorithm:histogram", -- Use the specified diff algorithm.
}
vim.opt.completeopt = { -- Options for insert mode completion.
	"menu", -- Use the pop-up menu.
	"menuone", -- Use the pop-up menu also when there is only one match.
	"noselect", -- Do not select a match in the menu.
}
vim.opt.fillchars = { -- Characters to be used in various user-interface elements.
	stl = " ", -- Status-line of the current window.
	stlnc = " ", -- Status-line of the non-current windows.
	vert = "│", -- Vertical separator to be used with :vsplit.
	fold = " ", -- Character to be used with 'foldtext'.
	diff = "╱", -- Deleted lines of the 'diff' option.
	msgsep = "─", -- Message separator for 'display' option.
	eob = "↴", -- Empty lines at the end of a buffer.
}
vim.opt.ruler = false -- Disable showing line and column numbers in command line.
vim.opt.list = true -- Show characters in 'listchars' in place of certain special characters.
vim.opt.listchars = { -- Strings to use when 'list' option set.
	tab = "│ ", -- Characters to be used to show a tab.
	nbsp = "␣", -- Character to show for a non-breakable space character.
	extends = "·", -- Character to show in the last column, when 'wrap' is off.
	precedes = "·", -- Character to show in the first visible column.
	eol = "↴",
	space = "⋅",
}
vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu.
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'.
vim.opt.foldlevelstart = 99 -- Start editing with all folds open.
vim.opt.foldopen = { -- Specifies for which type of commands folds will be opened.
	"hor", -- Horizontal movements: "l", "w", "fx", etc.
	"mark", -- Jumping to a mark: "'m", CTRL-O, etc.
	"percent", -- % key.
	"quickfix", -- ":cn", ":crew", ":make", etc.
	"tag", -- Jumping to a tag: ":ta", CTRL-T, etc.
	"undo", -- Undo or redo: "u" and CTRL-R.
}
vim.opt.grepprg = "grep " -- Program to use for the :grep command.
	.. "--line-number "
	.. '--binary-file="without-match" '
	.. "--no-messages "
	.. "--recursive "
	.. "--exclude-dir={.git,node_modules} "
	.. "--perl-regexp"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m" -- Format to recognize for the :grep command output.
vim.opt.ignorecase = false -- Don't ignore case in search patterns.
vim.opt.smartcase = true -- Set 'noignorecase' if search pattern contains an uppercase letter.
vim.opt.undolevels = 100000 -- Maximum number of changes that can be undone.
vim.opt.splitbelow = true -- Splitting a window will put the new window below of the current one.
vim.opt.splitright = true -- Splitting a window will put the new window right of the current one.
vim.opt.showcmd = true -- Enable displaying key presses at the right bottom.
vim.opt.showmode = true -- Enable native mode indicator.

-- Window Options
vim.opt.breakindent = true -- Wrapped lines will be visually indented with same amount of space.
vim.opt.wrap = false -- Prevent wrapping for long lines.
vim.opt.linebreak = true -- Wrap long lines at a character in 'breakat'.
vim.opt.number = true -- Print the line number in front of each line.
vim.opt.relativenumber = true -- Print the line numbers relative to the current cursor position.
vim.opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
vim.opt.signcolumn = "yes" -- Always draw the sign column even there is no sign in it.
vim.opt.foldmethod = "indent" -- Use indent folding method to fold lines.

-- Buffer Options
vim.opt.modeline = false -- Disable modeline feature altogether.
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth = 0 -- Number of spaces to use for each step of auto indent.
vim.opt.softtabstop = -1 -- Number of spaces that a <Tab> counts.
vim.opt.expandtab = true -- Use spaces instead of tab characters.
vim.opt.undofile = true -- Persist undo history to an undo file.

-- Make sure to set `mapleader` before lazy.nvim so your mappings are correct
vim.g.mapleader = " "
require("lazy").setup("plugins")
