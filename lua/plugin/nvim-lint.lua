return
{
  'mfussenegger/nvim-lint',
  dependencies =
  {
    {
      'williamboman/mason.nvim',
      'rshkarin/mason-nvim-lint',
    },
  },
  config = function()
    local lint = require('lint')
    lint.linters_by_ft =
    {
      ['ghaction.yaml'] = { 'actionlint', },
      -- javascript = { 'eslint_d', },
      -- typescript = { 'eslint_d', },
      -- text = { 'vale', },
      markdown = { 'vale', },
      -- note: ruff LSP for python should be enough, dont also need a linter.
    }

    require('mason-nvim-lint').setup(
      {
        ensure_installed = { 'actionlint', },
      })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWrite', 'BufModifiedSet', },
      {
        callback = function()
          require('lint').try_lint()
        end,
      })
  end,
}
