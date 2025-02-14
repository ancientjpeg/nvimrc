return
{
  'rshkarin/mason-nvim-lint',
  dependencies =
  {
    {
      'mfussenegger/nvim-lint',
      dependencies = { 'williamboman/mason.nvim', },
      config = function()
        require('lint').linters_by_ft =
        {
          ['ghaction.yaml'] = { 'actionlint', },
          javascript = { 'eslint', },
          typescript = { 'eslint', },
        }

        vim.api.nvim_create_autocmd({ 'BufEnter', },
          {
            callback = function()
              require('lint').try_lint()
              print('LINT BUFNEW!')
            end,
          })
      end,
    },
  },
  config = function()
    require('mason-nvim-lint').setup(
      {
        ensure_installed =
        {
          'actionlint',
          'eslint',
        },
      })
  end,
}
