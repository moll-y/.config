require('fzf-lua').setup({
  winopts = {
    height = 0.5,
    width = 1,
    row = 0.99,
    col = 0.50,
    border = { ' ', '─', ' ', ' ', ' ', ' ', ' ', ' ' },
    preview = {
      hidden = 'hidden',
    },
  },
  files = {
    prompt = 'Files> ',
    git_icons = false,
    cmd = table.concat({
      'find .',
      '-type f',
      '-not -path "*node_modules*"',
      '-not -path "*.settings*"',
      '-not -path "*target*"',
      '-not -path "*build*"',
      '-not -path "*/.git/*"',
      '-printf "%P\n"',
    }, ' '),
  },
})

vim.api.nvim_set_keymap('n', '<Leader>p', '<Cmd>FzfLua files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>FzfLua buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', '<Cmd>FzfLua live_grep<CR>', { noremap = true, silent = true })
