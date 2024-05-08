return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local treesitter_configs = require('nvim-treesitter.configs')
    treesitter_configs.setup({

      -- A list of parser names, or "all"
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "rust",
        "bash",
        "lua",
        "python",
        "query",
        "json",
        "tsx",
        "vim",
        "vimdoc",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = false,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "c", "cpp", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

    })
  end
}
