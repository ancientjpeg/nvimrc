return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({})

    vim.keymap.set('n', '<leader>gb', function() vim.cmd('BufferLinePick') end)
    vim.keymap.set('n', '<leader>gD', function() vim.cmd('BufferLinePickClose') end)
    vim.keymap.set('n', '<leader>go', function() vim.cmd('BufferLineCloseOthers') end)
    vim.keymap.set('n', '<leader>ga', function()
      vim.cmd('BufferLineCloseOthers')
      vim.cmd('bd')
    end)

    vim.keymap.set('n', '<leader>1', function() vim.cmd('BufferLineGoToBuffer 1 ') end)
    vim.keymap.set('n', '<leader>2', function() vim.cmd('BufferLineGoToBuffer 2 ') end)
    vim.keymap.set('n', '<leader>3', function() vim.cmd('BufferLineGoToBuffer 3 ') end)
    vim.keymap.set('n', '<leader>4', function() vim.cmd('BufferLineGoToBuffer 4 ') end)
    vim.keymap.set('n', '<leader>5', function() vim.cmd('BufferLineGoToBuffer 5 ') end)
    vim.keymap.set('n', '<leader>6', function() vim.cmd('BufferLineGoToBuffer 6 ') end)
    vim.keymap.set('n', '<leader>7', function() vim.cmd('BufferLineGoToBuffer 7 ') end)
    vim.keymap.set('n', '<leader>8', function() vim.cmd('BufferLineGoToBuffer 8 ') end)
    vim.keymap.set('n', '<leader>9', function() vim.cmd('BufferLineGoToBuffer 9 ') end)
    vim.keymap.set('n', '<leader>$', function() vim.cmd('BufferLineGoToBuffer -1') end)
  end
}
