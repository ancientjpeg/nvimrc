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

      function _G.set_terminal_keymaps()
        local map_opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], map_opts)
        -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], map_opts)
        -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
        -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], map_opts)
        -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], map_opts)
        -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], map_opts)
        -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], map_opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
    opts = {
      open_mapping    = [[<C-\>]],
      size            = 22,
      direction       = 'horizontal',
      insert_mappings = false,
    },
  }
}
