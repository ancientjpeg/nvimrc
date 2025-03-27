return
{
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio', },
  -- https://github.com/rcarriga/nvim-dap-ui/issues/442
  tag          = 'v3.8.2',
  config       = function()
    local dap, dapui = require('dap'), require('dapui')

    dapui.setup(
      {
        layouts =
        {
          {
            elements =
            {
              {
                id = 'scopes',
                size = 0.25,
              },
              {
                id = 'breakpoints',
                size = 0.25,
              },
              {
                id = 'stacks',
                size = 0.25,
              },
              {
                id = 'watches',
                size = 0.25,
              },
            },
            position = 'left',
            size = 60,
          },
          {
            elements =
            {
              {
                id = 'repl',
                size = 0.5,
              },
              {
                id = 'console',
                size = 0.5,
              },
            },
            position = 'bottom',
            size = 30,
          },
        },
      })

    -- uncomment these if you want the UI to open/close automatically
    -- dap.listeners.before.attach.dapui_config = function()
    --   dapui.open()
    -- end
    -- dap.listeners.before.launch.dapui_config = function()
    --   dapui.open()
    -- end
    -- dap.listeners.before.event_terminated.dapui_config = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   dapui.close()
    -- end

    vim.keymap.set('n', '<leader>du', dapui.toggle)
    vim.keymap.set('n', '<leader>dU', function()
      dapui.toggle({ reset = true, })
    end)
  end,
}
