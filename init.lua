-- early setups

-- disable netrw at the very start of your init.lua [ nvim-tree ]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- source all usr config first
require("usr")
require("plugin")
require("after")
