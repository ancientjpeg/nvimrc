return {
  'airblade/vim-gitgutter',
  config = function()
    vim.g.gitgutter_enabled = 1
    vim.g.gitgutter_highlight_lines = 1
    vim.g.gitgutter_highlight_linenrs = 1
    vim.o.updatetime = 100
  end
}
