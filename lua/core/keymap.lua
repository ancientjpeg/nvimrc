-- reset leader
vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<Esc>')

-- primeagen keybinds
-- keep cursor in center when moving rapidly
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v', }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v', }, '<leader>d', [["_d]])

-- pane split keymaps
vim.keymap.set('n', '<leader>s', function() vim.cmd('split') end)
vim.keymap.set('n', '<leader>v', function() vim.cmd('vsplit') end)

-- quickfix quickbinds
vim.keymap.set('n', '<leader>qq', '<cmd>cclose<CR>');
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>');
vim.keymap.set('n', '<leader>qp', '<cmd>cp<CR>');
vim.keymap.set('n', '<leader>qn', '<cmd>cn<CR>');
