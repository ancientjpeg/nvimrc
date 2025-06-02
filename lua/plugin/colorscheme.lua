return
{
  'dasupradyumna/midnight.nvim',
  dependencies = { 'catppuccin/nvim', },
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'midnight'
  end,
}
