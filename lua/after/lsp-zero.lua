local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- keybindings are listed here:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- technically these are "diagnostic signs"
-- neovim enables them by default.
-- here we are just changing them to fancy icons.
lsp_zero.set_sign_icons({
  error = '⛌',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['clangd'] = { 'cpp' },
    ['rust_analyzer'] = { 'rust' },
    ['tsserver'] = { 'javascript', 'typescript' },
    ['lua_ls'] = { 'lua' },
  }
})


local lspconfig = require('lspconfig')


-- clangd setup (already installed from brew)
lspconfig.clangd.setup({
  init_options = {
    compilationDatabasePath = "build",
  },
  cmd = {
    '/opt/homebrew/opt/llvm/bin/clangd'
  },
})

-- clangd-specific binding
vim.keymap.set('n', 'ø', vim.cmd.ClangdSwitchSourceHeader)


-- install other LSPs via mason
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'pyright'
  },
  handlers = {
    lsp_zero.default_setup,
    eslint = function()
      require('lspconfig').eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,
    lua_ls = function()
      -- silence vim warning in lua_ls
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
      )
    end
  }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})
