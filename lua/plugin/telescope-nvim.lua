-- nvim-telescope and telescope algo

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- fuzzy finder algo
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = '\
      cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
      cmake --build build --config Release && \
      cmake --install build --prefix build',
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
        path_display         = { "truncate" },
        file_ignore_patterns = {
          "node_modules"
        },
        cache_picker         = {
          num_pickers = 6,
        }
      },
      extensions = {
        fzf = {
          fuzzy                   = true,          -- false will only do exact matching
          override_generic_sorter = true,          -- override the generic sorter
          override_file_sorter    = true,          -- override the file sorter
          case_mode               = "ignore_case", -- or "ignore_case" or "respect_case"
        }
      }
    })
    telescope.load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fF', function()
      builtin.find_files({
        find_command     = { -- solely to exclude .git from searches
          'rg',
          '--files',
          '--hidden',
          '--no-ignore',
          '--glob',
          '!.git',
        },
        no_ignore        = true,
        no_ignore_parent = true,
        hidden           = true,
      })
    end)
    vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args)
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fr', builtin.resume, {})
    vim.keymap.set('n', '<leader>fp', builtin.pickers, {})
    vim.keymap.set('n', '<leader>fm', builtin.marks, {})
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
    vim.keymap.set('n', '<leader>fQ', builtin.quickfixhistory, {})
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>fcc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>fcb', builtin.git_bcommits, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
  end
}
