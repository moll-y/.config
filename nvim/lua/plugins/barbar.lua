local M = {
	"romgrk/barbar.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}

function M.config()
	require("bufferline").setup({
		closable = false,
	})

	vim.keymap.set("n", "<leader>t", "<Cmd>BufferPick<CR>")
end

return M
