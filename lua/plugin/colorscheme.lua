return
{
  'dasupradyumna/midnight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'midnight'
  end,
}
-- {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
--   config = function()
--     require('everforest').setup(
--       {
--         background = 'soft',
--         transparent_background_level = 1,
--         -- Your config here
--       })

--     vim.cmd('colorscheme everforest')
--   end,
-- }
