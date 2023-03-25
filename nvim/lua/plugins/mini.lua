local M = {
	"echasnovski/mini.nvim",
	version = "*",
}

function M.config()
	require("mini.cursorword").setup({
		delay = 100,
	})

	require("mini.indentscope").setup({
		draw = {
			delay = 100,
			gen_animation = {
				"quadraticOut",
				{
					duration = 40,
					unit = "step",
				},
			},
		},

		mappings = {
			object_scope = "",
			object_scope_with_border = "",
			goto_top = "[i",
			goto_bottom = "]i",
		},

		options = {
			border = "both",
			indent_at_cursor = true,
			try_as_border = true,
		},
		symbol = "╎",
	})
end

return M
