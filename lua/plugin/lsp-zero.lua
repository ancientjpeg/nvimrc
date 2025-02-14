return
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies =
  {
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    { 'neovim/nvim-lspconfig', },
    { 'hrsh7th/cmp-nvim-lsp', },
    { 'hrsh7th/nvim-cmp', },
    { 'L3MON4D3/LuaSnip', },
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- keybindings are listed here:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings
      lsp_zero.default_keymaps({ buffer = bufnr, })
    end)

    -- technically these are "diagnostic signs"
    -- neovim enables them by default.
    -- here we are just changing them to fancy icons.
    lsp_zero.set_sign_icons(
      {
        error = '⛌',
        warn = '▲',
        hint = '⚑',
        info = '»',
      })

    lsp_zero.format_on_save(
      {
        format_opts = { async = false, timeout_ms = 10000, },
        servers     =
        {
          ['clangd']        = { 'c', 'cpp', },
          ['rust_analyzer'] = { 'rust', },
          ['ts_ls']         = { 'javascript', 'typescript', 'typescriptreact', },
          ['lua_ls']        = { 'lua', },
          ['jsonls']        = { 'json', },
          ['cssls']         = { 'css', },
          ['svelte']        = { 'svelte', },
        },
      })


    local lspconfig = require('lspconfig')


    -- clangd setup (already installed from brew)
    lspconfig.clangd.setup(
      {
        init_options = { compilationDatabasePath = 'build', },
        cmd =
        {
          (vim.fn.has('macunix') ~= 0) and '/opt/homebrew/opt/llvm/bin/clangd' or 'clangd',
          '--function-arg-placeholders=0',
          '--clang-tidy',
          '--background-index',
          '--header-insertion=never',
        },
      })
    -- clangd-specific binding
    vim.keymap.set('n', 'ø', vim.cmd.ClangdSwitchSourceHeader)
    vim.keymap.set('n', '<M-o>', vim.cmd.ClangdSwitchSourceHeader)


    -- install other LSPs via mason
    require('mason-lspconfig').setup(
      {
        ensure_installed =
        {
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'ts_ls',
          'cssls',
          'jsonls',
          'html',
          'svelte',
        },

        handlers =
        {
          lsp_zero.default_setup,
          lua_ls = function()
            require('lspconfig').lua_ls.setup
            {
              on_init  = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,
                  {
                    runtime   =
                    {
                      -- Tell the language server which version of Lua you're using
                      -- (most likely LuaJIT in the case of Neovim)
                      version = 'LuaJIT',
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace =
                    {
                      checkThirdParty = false,
                      library         =
                      {
                        vim.env.VIMRUNTIME,
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                      },
                      -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                      -- library = vim.api.nvim_get_runtime_file("", true)
                    },
                  })
              end,
              settings =
              {
                Lua =
                {
                  diagnostics =
                  {
                    -- silence vim warning in lua_ls
                    globals = { 'vim', },
                  },
                  format =
                  {
                    enable        = true,
                    defaultConfig =
                    {
                      align_continuous_assign_statement = 'true',
                      align_continuous_rect_table_field = 'true',
                      align_array_table                 = 'always',
                      table_separator_style             = 'comma',
                      quote_style                       = 'single',
                      break_before_braces               = 'true',
                      break_all_list_when_line_exceed   = 'true',
                      trailing_table_separator          = 'always',
                    },
                  },
                },
              },
            }
          end,
        },
      })

    -- PYRIGHT CONF - FORMAT WITH BLACK !
    local group = vim.api.nvim_create_augroup('Black', { clear = true, })
    vim.api.nvim_create_autocmd('bufWritePost', { pattern = '*.py', command = 'silent !black %', group = group, })
  end,
}
