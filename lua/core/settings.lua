vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = vim.o.softtabstop

vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = false

-- Don't keep search terms highlighted, but do incr search
vim.o.hlsearch = false
vim.o.incsearch = true

-- smartcase search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.scrolloff = 5

vim.o.updatetime = 50
vim.o.colorcolumn = "80"

-- stop auto-comment on newlines https://www.reddit.com/r/neovim/comments/sqld76/stop_automatic_newline_continuation_of_comments/
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- filetype indent on
vim.cmd('filetype plugin indent on')

-- i have never once found a swapfile to be helpful.
vim.o.swapfile = false
