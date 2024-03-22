--
--return {
--  "iagorrr/noctishc.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function() vim.cmd("colorscheme noctishc") end
--}
--return {
--  'nyngwang/nvimgelion',
--  config = function()
--    -- do whatever you want for further customization~
--    vim.cmd("colorscheme nvimgelion")
--  end
--}

-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark" -- set this to dark or light
--     vim.cmd("colorscheme oxocarbon")
--   end
-- }

return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      background = "hard",
      transparent_background_level = 1,
      -- Your config here
    })

    vim.cmd("colorscheme everforest")
  end,
}
