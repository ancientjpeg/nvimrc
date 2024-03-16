return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle);

    require("nvim-tree").setup({
      filters = {
        git_ignored = false,
      },
      view = {
        signcolumn = "auto",
        number = true,
        relativenumber = true,
        -- float = {
        --   enable = true,
        -- },
      },
    })
  end
}
