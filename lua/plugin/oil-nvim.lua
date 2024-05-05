return {
  'stevearc/oil.nvim',
  lazy         = false,
  opts         = {
    keymaps = {
      ["<leader>H"] = "actions.parent",
      ["<leader>L"] = "actions.select",
    }
  },
  dependencies  = { "nvim-tree/nvim-web-devicons" },
  keys          = {
    { "-", "<cmd>Oil <cr>",                   desc = "Oil - Open Parent Dir" },
    { "_", "<cmd>execute 'Oil' getcwd()<cr>", desc = "Oil - Open Current Working Dir" },
  }
}
