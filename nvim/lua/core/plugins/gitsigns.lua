local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitsigns").setup()
  end,
}

return M
