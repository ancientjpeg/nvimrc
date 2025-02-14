return
{
  'mfussenegger/nvim-lint',
  dependencies =
  {
  },
  config = function()
    require('lint').linters_by_ft =
    {
      ghaction = { 'actionlint', },
    }
  end,
}
