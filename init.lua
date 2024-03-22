-- disable netrw at the very start of your init.lua [ nvim-tree ]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- source all usr config first
require("usr")
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
