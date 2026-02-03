local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Open verticle split' })
vim.keymap.set('n', '<leader>sh', '<C-w>h', { desc = 'Open horizontal split' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Harpoon
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- Navigate between files
vim.keymap.set('n', '<leader>1', function()
  ui.nav_file(1)
end)
vim.keymap.set('n', '<leader>2', function()
  ui.nav_file(2)
end)
vim.keymap.set('n', '<leader>3', function()
  ui.nav_file(3)
end)
vim.keymap.set('n', '<leader>4', function()
  ui.nav_file(4)
end)

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- tmux-sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-x>', '<C-w><C-c>', { desc = 'Close current split' })

-- fix/location list nav
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')

vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')

-- custom macros
vim.api.nvim_create_augroup('PythonLogMacro', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'PythonLogMacro',
  pattern = { 'python' },
  callback = function()
    vim.keymap.set('v', 'gl', 'yoprint(f"pA: {pA}")', { buffer = true })
  end,
})
