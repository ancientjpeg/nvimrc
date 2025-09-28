return
{
  {
    'dasupradyumna/midnight.nvim',
    dependencies = { 'catppuccin/nvim', },
    lazy = false,
    priority = 1000,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts =
    {
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd.colorscheme('midnight')
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd.colorscheme('cyberdream-light')
      end,
      update_interval = 3000,
      fallback = 'dark',
    },
  },
}
