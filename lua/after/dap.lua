local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
  {
    name = 'Launch Standalone',
    type = 'lldb',
    request = 'launch',
    program = function()
      local plugin_name = vim.fn.input('Plugin name: ', 'Current')
      local plugin_snake = string.lower(string.gsub(plugin_name, ' ', '_'))
      local config = vim.fn.input('Config: ', 'Debug')
      local path = '/build/plugins/' ..
          plugin_snake .. '/' .. plugin_snake .. '_artefacts/' .. config .. '/Standalone/' .. plugin_name .. '.app'
      return vim.fn.getcwd() .. path
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

local telescope = require('telescope')
telescope.load_extension('dap')

-- highlights + icons
-- https://github.com/mfussenegger/nvim-dap/discussions/355#discussioncomment-2159022
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', {
  text = '⏹',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl =
  'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
  { text = '⏯', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '⚠', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

-- keymappings


-- tenative
vim.keymap.set('n', '<leader>da', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end)

vim.keymap.set('n', '<leader>dp', function()
  require('dap').toggle_breakpoint()
  require('dap').continue()
end)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end) -- keep this one even if the other F-keys are unused
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>db', function() telescope.extensions.dap.list_breakpoints() end)
vim.keymap.set('n', '<Leader>dl',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dc', function() require('dap').repl.toggle() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>dq', function() require('dap').terminate() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
