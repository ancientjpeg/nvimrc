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
