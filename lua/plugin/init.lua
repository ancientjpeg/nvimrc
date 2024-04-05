-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugin specs
local plugin_specs = {

  -- [[ lsp ]]
  -- lsp-zero
  require('plugin.lsp.lsp-zero'),

  -- treesitter
  require('plugin.lsp.treesitter'),

  -- incremental rename helper
  require('plugin.lsp.inc-rename'),


  -- [[ debug ]]
  require('plugin.debug.nvim-dap'),
  require('plugin.debug.nvim-dap-ui'),

  -- [[ nav ]]
  -- telescope
  require('plugin.nav.telescope-nvim'),

  -- nvim-tree
  require('plugin.nav.nvim-tree'),

  -- harpoon
  require('plugin.nav.harpoon'),


  -- tmux nav
  require('plugin.nav.vim-tmux-navigator'),

  -- [[ git ]]
  require('plugin.git.gitsigns'),
  require('plugin.git.vim-fugitive'),
  require('plugin.git.diffview'),

  -- [[ editor ]]
  -- statusline
  require('plugin.editor.lualine'),

  -- theme
  require('plugin.editor.theme'),

  -- vim-commentary
  require('plugin.editor.vim-commentary'),

  -- blankline
  require('plugin.editor.indent-blankline'),

  -- [[ misc ]]
  -- markdown
  require('plugin.misc.markdown-preview'),

}


local lazy_config = {
  install = {
    colorscheme = {
      'everforest'
    }
  }
}

require('lazy').setup(
  plugin_specs,
  lazy_config
)
