return
{
  'ancientjpeg/cmake-tools.nvim',
  branch = 'remove-cmake-buffer',
  config = true,
  opts =
  {
    cmake_build_directory = 'build',
    cmake_soft_link_compile_commands = true,
    use_scratch = false,
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
    --     direction = 'horizontal',
    --   },
    -- },
  },
  keys =
  {
    { '<leader>cg', '<cmd>CMakeGenerate<cr>', },
    { '<leader>cb', '<cmd>CMakeBuild<cr>', },
    { '<leader>cB', '<cmd>CMakeSelectBuildTarget<cr>', },
    { '<leader>cd', '<cmd>CMakeDebug<cr>', },
    { '<leader>cr', '<cmd>CMakeRun<cr>', },
    { '<leader>cq', '<cmd>CMakeStopExecutor<cr>', },
    { '<leader>cQ', '<cmd>CMakeStopRunner<cr>', },
    { '<leader>cl', '<cmd>CMakeSelectLaunchTarget<cr>', },
  },
}
