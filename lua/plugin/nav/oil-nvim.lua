return {
  'stevearc/oil.nvim',
  opts         = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys         = {
    { "-", "<cmd>Oil <cr>",        desc = "Oil - Open Parent Dir" },
    { "_", "<cmd>Oil --float<cr>", desc = "Oil - Open Parent Dir (Floating Window)" },
  }

}
