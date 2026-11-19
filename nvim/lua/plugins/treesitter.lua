-- nvim-treesitter "main" branch (the one that supports Neovim 0.12). Needs the tree-sitter CLI.
-- Incremental selection is built into Neovim now: in visual mode, `an` grows and `in` shrinks.
local languages = {
	"bash",
	"c",
	"diff",
	"go",
	"gomod",
	"html",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"kotlin",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"markdown_inline",
	"printf",
	"python",
	"query",
	"regex",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(languages)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- pcall: skip filetypes that have no parser
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
