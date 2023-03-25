local M = {
	"mhartington/formatter.nvim",
}

function M.config()
	require("formatter").setup({
		logging = true,
		log_level = 2,
		filetype = {
			lua = {
				function()
					return {
						exe = "stylua",
						args = { "-" },
						stdin = true,
					}
				end,
			},
			cs = {
				function()
					return {
						exe = "dotnet csharpier",
						args = {
							"--write-stdout",
						},
						stdin = true,
					}
				end,
			},
			svelte = {
				function()
					return {
						exe = "prettier",
						args = {
							"--stdin-filepath",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						},
						stdin = true,
					}
				end,
			},
			typescript = {
				function()
					return {
						exe = "prettier",
						args = {
							"--stdin-filepath",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						},
						stdin = true,
					}
				end,
			},
			typescriptreact = {
				function()
					return {
						exe = "prettier",
						args = {
							"--stdin-filepath",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						},
						stdin = true,
					}
				end,
			},
			rust = {
				function()
					return {
						exe = "rustfmt",
						args = { "--emit=stdout" },
						stdin = true,
					}
				end,
			},
		},
	})

	vim.keymap.set("n", "<leader>F", "<Cmd>Format<CR>")
end

return M
