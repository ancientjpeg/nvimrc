local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch LLDB',
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
    name = 'Attach LLDB',
    type = 'lldb',
    request = 'attach',
    cwd = '${workspaceFolder}',
    pid = function()
      return require('dap.utils').pick_process()
    end,
    stopOnEntry = false,
    args = {},
  },
  {
    name = 'Attach LLDB by PID',
    type = 'lldb',
    request = 'attach',
    cwd = '${workspaceFolder}',
    pid = function()
      local id = vim.fn.input("PID: ", "32757")
      return tonumber(id)
    end,
    stopOnEntry = false,
    args = {},
  },
}

-- python
require('dap-python').setup()

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

-- quickly get out of hover windows
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dap-float',
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>close!<CR>', { buffer = true })
  end
})

-- keymappings
-- https://www.reddit.com/r/neovim/comments/12wypuf/what_has_been_peoples_experience_with_nvimdap_or/
vim.keymap.set('n', '<leader>d<space>', function() dap.continue() end)
vim.keymap.set('n', '<leader>dj', function() dap.step_over() end)
vim.keymap.set('n', '<leader>dl', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dh', function() dap.step_out() end)

-- unset breakpoint and proceed
vim.keymap.set('n', '<leader>dP', function()
  dap.set_breakpoint()
  dap.toggle_breakpoint()
  dap.continue()
end)

vim.keymap.set('n', '<leader>dx', function() dap.clear_breakpoints() end)

vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>db', function() telescope.extensions.dap.list_breakpoints() end)
vim.keymap.set('n', '<Leader>dL',
  function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dc', function() dap.repl.toggle() end)
vim.keymap.set('n', '<Leader>dr', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>dq', function() dap.terminate() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dH', function()
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
