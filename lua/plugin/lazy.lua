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
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- nvim-telescope and telescope algo
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      },
    }
  },


  -- lsp-zero installation
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },

  'Shatur/neovim-tasks',
  {
    'airblade/vim-gitgutter',
    config = function()
      vim.g.gitgutter_enabled = 1
      vim.g.gitgutter_highlight_lines = 1
      vim.g.gitgutter_highlight_linenrs = 1
    end
  },
  'mfussenegger/nvim-dap',


  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme moonfly")
    end,
  },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup({
  --       commentStyle = { italic = false },
  --       theme = "dragon",
  --       background = {
  --         dark = "dragon",
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
      'moonfly'
    }
  }
}

require('lazy').setup(
  plugin_setups,
  lazy_config
)
