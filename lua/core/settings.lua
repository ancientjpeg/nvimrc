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

vim.o.scrolloff = 8

vim.o.updatetime = 50
vim.o.colorcolumn = '80'

-- stop auto-comment on newlines https://www.reddit.com/r/neovim/comments/sqld76/stop_automatic_newline_continuation_of_comments/
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- add tpp to cpp filetype
vim.cmd('au! BufNewFile,BufRead *.tpp set filetype=cpp')

-- Create cmake filetype
vim.cmd('au! BufNewFile,BufRead CMakeLists.txt set filetype=cmake')

-- add .dist to xml
vim.cmd('au! BufNewFile,BufRead *.dist set filetype=xml')

-- filetype indent on
vim.cmd('filetype plugin indent on')

-- i have never once found a swapfile to be helpful.
vim.o.swapfile = false


vim.api.nvim_create_autocmd('FileType',
{
  pattern = 'cmake',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})
