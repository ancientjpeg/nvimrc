-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



local plugin_specs = {}
local config_path = vim.fn.stdpath('config') .. '/lua/plugin'
for path in vim.fs.dir(config_path, { depth = 10 }) do
  if string.match(path, [[%.lua]]) and string.match(path, [[/]]) then
    path = string.gsub(path, [[%.lua]], ""):gsub("/", ".")
    path = 'plugin.' .. path
    local spec = require(path)

    if spec then
      CONFIG_LOG(path)
      table.insert(plugin_specs, spec)
    end
  end
end




local lazy_config = {
  install = {
    colorscheme = {
      'everforest'
    }
  }
}

require('lazy').setup(
  plugin_specs,
  lazy_config
)
