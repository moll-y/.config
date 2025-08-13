return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		require("telescope").setup({})
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none" })
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
	},
}
