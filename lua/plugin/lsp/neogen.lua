return {
  "danymat/neogen",
  config = function()
    local i             = require("neogen.types.template").item
    local doxygen_setup = {
      { nil,         "/**",                                               { no_results = true, type = { "func", "file", "class" } } },
      { nil,         " * @file $1",                                       { no_results = true, type = { "file" } } },
      { nil,         " * @author Jackson Kaplan (jackson@minimal.audio)", { no_results = true, type = { "file" } } },
      { nil,         " * @date " .. os.date("%Y-%m-%d"),                  { no_results = true, type = { "file" } } },
      { nil,         " * Copyright © 2024 Minimal. All rights reserved.", { no_results = true, type = { "file" } } },
      { nil,         " */",                                               { no_results = true, type = { "func", "file", "class" } } },
      { nil,         "",                                                  { no_results = true, type = { "file" } } },

      { nil,         "/**",                                               { type = { "func", "class", "type" } } },
      { i.ClassName, " * @class %s",                                      { type = { "class" } } },
      { i.Type,      " * @typedef %s",                                    { type = { "type" } } },
      { nil,         " * @brief $1",                                      { type = { "func", "class", "type" } } },
      { nil,         " *",                                                { type = { "func", "class", "type" } } },
      { i.Tparam,    " * @tparam %s $1" },
      { i.Parameter, " * @param %s $1" },
      { i.Return,    " * @return $1" },
      { nil,         " */",                                               { type = { "func", "class", "type" } } },
    }

    require('neogen').setup({
      languages = {
        cpp = {
          template = {
            annotation_convention = "custom_doxygen",
            custom_doxygen = doxygen_setup
          }
        }
      }
    })
  end,
  keys   = {
    { "<leader>nf", "<cmd>Neogen<cr>",      desc = "Neogen Generate" },
    { "<leader>nF", "<cmd>Neogen file<cr>", desc = "Neogen Generate File Docstring" },
  },
}
