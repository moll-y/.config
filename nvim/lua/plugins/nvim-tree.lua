-- File tree on the left. Space e opens/closes it (and shows the current file in it).
-- Inside the tree: Enter open, Ctrl-t open in a new tab, a add, d delete, r rename, g? all keys.
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
	keys = {
		{ "<leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "File tree" },
	},
	opts = {
		view = { width = 32 },
		renderer = {
			group_empty = true, -- show a/b/c as one line when the folders only hold each other
			-- git marks: the same letters as `git status -s`
			icons = {
				glyphs = {
					git = {
						untracked = "?",
						unstaged = "M",
						staged = "A",
						renamed = "R",
						deleted = "D",
						unmerged = "U",
						ignored = "!",
					},
				},
			},
		},
		filters = { custom = { "^.git$" } },
		update_focused_file = { enable = true }, -- follow the current file
		on_attach = function(bufnr)
			require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
			-- the tree can't be split: Ctrl-w v / Ctrl-w s do nothing inside it
			for _, key in ipairs({ "<C-w>v", "<C-w><C-v>", "<C-w>s", "<C-w><C-s>", "<C-w>S" }) do
				vim.keymap.set("n", key, "<Nop>", { buffer = bufnr, desc = "No split in the tree" })
			end
		end,
	},
}
