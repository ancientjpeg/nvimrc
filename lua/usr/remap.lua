-- reset leader
vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<Esc>')

-- primeagen keybinds
-- keep cursor in center when moving rapidly
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- exit into netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- window rebinds [ TENATIVE ]
vim.keymap.set('n', '<leader>wq', '<C-w>q')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wl', '<C-w>l')



-- open a terminal below
vim.keymap.set('n', '<leader>to', function() vim.cmd(':below sp | resize 14 | term') end)
-- trying to close all terminal windows
-- vim.keymap.set('n', '<leader>tc', function()
--   for k, v in pairs(vim.fn.getwininfo())
--   do
--     if (v.terminal)
--     then
--       print(k)
--     end
--   end
-- end)
