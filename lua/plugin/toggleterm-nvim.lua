return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function(plugin, opts)
      require("toggleterm").setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      local yarndev  = Terminal:new({ cmd = "yarn dev", hidden = true, direction = "float", close_on_exit = false })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>g", _LAZYGIT_TOGGLE, { noremap = true, silent = true })

      vim.api.nvim_create_user_command("Yarn", function()
        yarndev:toggle()
      end, {})
    end,
    opts = {
      open_mapping    = [[<C-t>]],
      direction       = 'float',
      insert_mappings = false,
    },
  }
}
