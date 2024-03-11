-- nvim-telescope and telescope algo

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- fuzzy finder algo
    {
      'nvim-telescope/telescope-fzy-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    -- ripgrep args pass
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        path_display = { "smart" }
      }
    })


    telescope.load_extension('fzy_native')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set("n", "<leader>fG", function() telescope.extensions.live_grep_args.live_grep_args() end)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
  end
}
