--[[
  Mini
]]
--
return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.cursorword").setup({
      delay = 100,
    })
  end,
}
