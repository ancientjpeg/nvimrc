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

-- my own centered navs
vim.keymap.set("n", "<leader>j", "jzz")
vim.keymap.set("n", "<leader>k", "kzz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- exit into netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
