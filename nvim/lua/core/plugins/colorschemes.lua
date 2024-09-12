local M = {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
    },
    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        config = function()
            require("core.plugins.themes.tokyonight")
        end,
    },
    {
        'gbprod/nord.nvim',
        name = 'nord',
        lazy = false,
        priority = 1000,
    },
    {
        'sam4llis/nvim-tundra',
        name = 'tundra',
        lazy = false,
        priority = 1000,
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end,
    }
}

return M
