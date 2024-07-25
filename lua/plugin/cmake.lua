return
{
  'Civitasv/cmake-tools.nvim',
  config = true,
  opts =
  {
    cmake_build_directory = 'build',
    cmake_soft_link_compile_commands = true,
    cmake_dap_configuration =
    { -- debug settings for cmake
      name = 'CMake - cpp',
      type = 'lldb',
      request = 'launch',
      stopOnEntry = false,
    },
    -- cmake_executor =
    -- {
    --   name = 'toggleterm',
    --   opts =
    --   {
    --     direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
    --     close_on_exit = false, -- whether close the terminal when exit
    --     auto_scroll = true,  -- whether auto scroll to the bottom
    --   },
    -- },
  },
  keys =
  {
    { '<leader>cg', '<cmd>CMakeGenerate<cr>', },
    { '<leader>cb', '<cmd>CMakeBuild<cr>', },
    { '<leader>cd', '<cmd>CMakeDebug<cr>', },
    { '<leader>cr', '<cmd>CMakeRun<cr>', },
    { '<leader>cq', '<cmd>CMakeStopExecutor<cr>', },
    { '<leader>cQ', '<cmd>CMakeStopRunner<cr>', },
  },
}
