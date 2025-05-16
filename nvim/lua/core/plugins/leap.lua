local M = {
  "ggandor/leap.nvim",
  config = function()
    require("leap").set_default_mappings()
  end,
}

return M
