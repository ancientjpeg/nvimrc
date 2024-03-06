vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = vim.o.softtabstop

vim.o.number = true
vim.o.relativenumber = true

-- stop auto-comment on newlines https://www.reddit.com/r/neovim/comments/sqld76/stop_automatic_newline_continuation_of_comments/
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
