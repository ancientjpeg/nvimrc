-- begin logfile
-- local log_path = vim.fn.stdpath('log') .. '/ancientjpeg.log'

-- local log_file = io.open(log_path, "a")
-- if log_file:seek('end') > math.pow(2, 16) then
--   log_file:close()
--   log_file = io.open(log_path, "w")
-- end

-- CONFIG_LOG = function(msg)
--   local time = vim.fn.strftime("%Y-%m-%dT%H:%M:%S")
--   log_file:write("[" .. time .. "] " .. msg .. '\n')
-- end

-- CONFIG_LOG('===== BEGIN CONFIG LOG =====')

-- source all usr config first
require('core')

-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
  {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config =
{
  install =
  {
    colorscheme =
    {
      'everforest',
    },
  },
}

-- setup lazy.nvim and source plugin specs
require('lazy').setup(
  'plugin',
  lazy_config
)

-- run additional config if present
local function local_config()
  local cwd = vim.fn.getcwd()

  for path in vim.fs.dir(cwd) do
    if path == '.nvim.env' then
      local env_dir = cwd .. '/' .. path
      env_dir = vim.fs.normalize(env_dir)
      package.path = package.path .. ';' .. cwd .. '/.nvim.env/?.lua'
      require('localenv')
      return
    end
  end
end

local_config()

-- CONFIG_LOG('=====  END CONFIG LOG  =====\n')
-- log_file:close()
