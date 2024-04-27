-- begin logfile
local log_path = vim.fn.stdpath('log') .. '/ancientjpeg.log'
local _CONFIG_LOG_FILE = io.open(log_path, "a")


CONFIG_LOG = function(msg)
  io.output(_CONFIG_LOG_FILE)
  local time = vim.fn.strftime("%Y-%m-%dT%H:%M:%S")
  io.write("[" .. time .. "] " .. msg .. '\n')
end

CONFIG_LOG('===== BEGIN CONFIG LOG =====')

-- source all usr config first
require("core")
require("plugin")

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

CONFIG_LOG('=====  END CONFIG LOG  =====\n')
io.close(_CONFIG_LOG_FILE)
