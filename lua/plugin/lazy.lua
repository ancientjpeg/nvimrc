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

-- plugin setups
local plugin_setups = {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- lsp-zero installation
  require('plugin.lsp.lsp-zero'),

  -- incremental rename helper
  require('plugin.inc-rename'),


  -- debugging
  require('plugin.debug.nvim-dap'),
  require('plugin.debug.nvim-dap-ui'),

  -- telescope
  require('plugin.telescope'),

  -- nvim-tree
  require('plugin.nvim-tree'),

  -- harpoon
  require('plugin.harpoon'),

  -- statusline
  require('plugin.lualine'),

  -- tmux nav
  require('plugin.vim-tmux-navigator'),

  -- git
  require('plugin.gitsigns'),
  require('plugin.vim-fugitive'),
  require('plugin.diffview'),

  -- cmake
  require('plugin.vim-cmake'),

  -- vim-commentary
  require('plugin.vim-commentary'),

  -- blankline
  require('plugin.indent-blankline'),

  -- markdown
  require('plugin.markdown-preview'),

  -- theme
  require('plugin.theme')

}


local lazy_config = {
  install = {
    colorscheme = {
      'everforest'
    }
  }
}

require('lazy').setup(
  plugin_setups,
  lazy_config
)
