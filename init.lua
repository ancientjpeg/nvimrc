-- early setups

-- disable netrw at the very start of your init.lua [ nvim-tree ]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- source all usr config first
require("usr")
require("plugin")
require("after")

-- run additional config if present
local function local_config()
  local cwd = vim.fn.getcwd()
  local nvim_env_paths = vim.fs.find(
    'nvimenv',
    {
      type = 'directory',
      path = cwd,
      limit = 1
    }
  )

  if #nvim_env_paths ~= 1 then
    return
  end

  local init_path = vim.fs.find('init.lua', {
    path = nvim_env_paths[1],
    limit = 1
  })

  if #init_path ~= 1 then
    vim.print('Directory has .nvim.env but not init.lua!')
    return
  end


  package.path = package.path .. vim.fn.getcwd()
  require('nvimenv.init')
end

local_config()
