return
{
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio', },
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
                size = 1 / 3,
              },
              {
                id = 'breakpoints',
                size = 1 / 3,
              },
              {
                id = 'stacks',
                size = 1 / 3,
              },
            },
            position = 'left',
            size = 40,
          },
          {
            elements =
            {
              {
                id = 'watches',
                size = 0.5,
              },
              {
                id = 'repl',
                size = 0.5,
              },
            },
            position = 'bottom',
            size = 10,
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
  end,
}
