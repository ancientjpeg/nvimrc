return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle);
    -- empty setup using defaults
    require("nvim-tree").setup()
  end
}
