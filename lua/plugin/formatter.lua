return
{
  'mhartington/formatter.nvim',
  dependencies = { 'williamboman/mason.nvim', },
  config = function()
    -- TODO find a way to not do this ?? idiot ???
    local registry = require('mason-registry')
    if not registry.is_installed('prettierd') then
      registry.get_package('prettierd'):install()
    end

    local patch_exe = function(f, exe)
      local patched = function()
        local c = f()
        c.exe = exe
        return c
      end
      return patched
    end

    local formatter = require('formatter')
    local fts = require('formatter.filetypes')
    local prettierd_path = vim.fn.stdpath('data') .. '/mason/bin/prettierd'
    -- local prettierd_config_js = require('formatter.filetypes.javascript').prettierd()
    -- local prettierd_config_ts = require('formatter.filetypes.typescript').prettierd()
    -- prettierd_config_js.exe = prettierd_path
    -- prettierd_config_ts.exe = prettierd_path

    formatter.setup(
      {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        filetype =
        {
          javascript = patch_exe(fts.javascript.prettierd, prettierd_path),
          typescript = patch_exe(fts.typescript.prettierd, prettierd_path),
        },
      }
    )

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup('__formatter__', { clear = true, })
    autocmd('BufWritePost',
      {
        group = '__formatter__',
        command = ':FormatWrite',
      })
  end,
}
