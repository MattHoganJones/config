local M = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      'css';
      'scss';
      'yaml';
    html = { mode = 'foreground' };
  })
  end
}

return M
