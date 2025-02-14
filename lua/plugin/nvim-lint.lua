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
          javascript = { 'eslint_d', },
          typescript = { 'eslint_d', },
          text = { 'vale', },
          markdown = { 'vale', },
          python = { 'pylint', },
        }

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWrite', 'BufModifiedSet', },
          {
            callback = function()
              require('lint').try_lint()
            end,
          })
      end,
    },
  },
  config = function()
    require('mason-nvim-lint').setup({})
  end,
}
