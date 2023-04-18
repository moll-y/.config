--[[
  Telescope
]]
--
return {
  "nvim-telescope/telescope.nvim",
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
  keys = {
    {
      "<C-e>",
      function()
        if not pcall(require("telescope.builtin").git_files) then
          print(".git not found")
        end
      end,
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
    },
  },
}
