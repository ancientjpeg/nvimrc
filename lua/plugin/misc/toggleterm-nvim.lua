return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping    = [[<C-s>]],
      direction       = 'float',
      insert_mappings = true,
    },
    config = function(opts)
      require('toggleterm').setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>g", _LAZYGIT_TOGGLE, { noremap = true, silent = true })
    end
  }
}
