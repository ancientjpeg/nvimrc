return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.keymap.set('n', '<leader>ic', '<cmd>DiffviewClose<CR>')
    vim.keymap.set('n', '<leader>io', '<cmd>DiffviewOpen<CR>')
    vim.keymap.set('n', '<leader>iO', function()
      local args = vim.fn.input('DiffviewOpen args: ')
      local command = 'DiffviewOpen ' .. args
      vim.cmd(command)
    end)
  end
}
