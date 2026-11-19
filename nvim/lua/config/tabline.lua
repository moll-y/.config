-- Tab bar on the right, like the tmux window list: name, ● when modified; a cyan bold « between tabs.
-- The current tab is white and inside [brackets], the others dim. Click a tab to go to it.
local function tabline()
	local s = "%#TabLineFill#%="
	for i = 1, vim.fn.tabpagenr("$") do
		-- the tab's current window, but skip the file tree so the tab keeps the file's name
		local bufs = vim.fn.tabpagebuflist(i)
		local buf = bufs[vim.fn.tabpagewinnr(i)]
		if vim.bo[buf].filetype == "NvimTree" then
			for _, b in ipairs(bufs) do
				if vim.bo[b].filetype ~= "NvimTree" then
					buf = b
					break
				end
			end
		end
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
		if name == "" then
			name = "[No Name]"
		elseif name:match("^claude%-prompt%-") then
			name = "claude prompt" -- Ctrl-g in Claude Code; the real name has a long random id
		elseif vim.fn.strchars(name) > 24 then
			name = vim.fn.strcharpart(name, 0, 23) .. "…"
		end
		local hl = i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#"

		local cur = i == vim.fn.tabpagenr()
		if i > 1 then
			s = s .. "%#TabLineMark# « "
		end
		s = s .. "%" .. i .. "T" .. hl .. (cur and "[" or "")
		s = s .. name:gsub("%%", "%%%%")
		if vim.bo[buf].modified then
			s = s .. " ●"
		end
		s = s .. (cur and "]" or "") .. "%#TabLineFill#"
	end
	s = s .. " "
	return s .. "%T"
end

_G.Tabline = tabline
vim.o.tabline = "%!v:lua.Tabline()"

local function colors()
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
	-- Other tabs dim, the current one white.
	vim.api.nvim_set_hl(0, "TabLine", { fg = "#636da6", bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineMark", { fg = "#00cccc", bg = "none", bold = true }) -- the « between tabs
end
colors()
vim.api.nvim_create_autocmd("ColorScheme", { callback = colors })
