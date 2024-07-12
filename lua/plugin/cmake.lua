return
{
  'Civitasv/cmake-tools.nvim',
  config = true,
  opts =
  {
    cmake_build_directory = 'build',
    cmake_soft_link_compile_commands = true,
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
    { '<leader>cq', '<cmd>CMakeStopExecutor<cr>', },
  },
}
