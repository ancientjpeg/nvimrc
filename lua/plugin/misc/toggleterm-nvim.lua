return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function(plugin, opts)
      require("toggleterm").setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>g", _LAZYGIT_TOGGLE, { noremap = true, silent = true })
    end,
    opts = {
      -- open_mapping    = [[<C-s>]],
      open_mapping    = [[<C-\>]],
      direction       = 'float',
      insert_mappings = false,
    },
  }
}
