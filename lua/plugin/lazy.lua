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
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },


  -- debugging
  'mfussenegger/nvim-dap',

  -- telescope
  require('plugin.telescope'),

  -- git
  require('plugin.gitgutter'),
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- cmake + make
  'Shatur/neovim-tasks',

  -- colorscheme
  -- {
  --   'bluz71/vim-moonfly-colors',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = "dark"
  --     vim.cmd("colorscheme moonfly")
  --   end,
  -- },
  {
    "iagorrr/noctishc.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd("colorscheme noctishc") end
  },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup({
  --       commentStyle = { italic = false },
  --       theme = "wave",
  --       background = {
  --         dark = "wave",
  --         light = "lotus"
  --       }
  --     })
  --     vim.o.background = "dark"
  --     vim.cmd("colorscheme kanagawa")
  --   end,
  -- }
}


local lazy_config = {
  install = {
    colorscheme = {
      'noctishc'
    }
  }
}

require('lazy').setup(
  plugin_setups,
  lazy_config
)
