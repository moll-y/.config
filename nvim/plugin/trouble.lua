require('trouble').setup()

vim.api.nvim_set_keymap('n', '<Leader>x', '<Cmd>TroubleToggle<CR>', { noremap = true, silent = true })
