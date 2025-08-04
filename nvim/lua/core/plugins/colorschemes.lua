return {
    {
        'nyngwang/nvimgelion',
        -- config = function()
        --     -- vim.cmd("colorscheme nvimgelion")
        -- end,
    },
    {
        'sainnhe/gruvbox-material',
        -- config = function()
        --     vim.cmd("colorscheme gruvbox-material")
        -- end,
    },
    {
        'rmehri01/onenord.nvim',
    },
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
            vim.cmd("colorscheme tokyonight-night")
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
        -- config = function()
        --     vim.cmd("colorscheme catppuccin-mocha")
        -- end,
    },
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        priority = 1000,
        -- config = function()
        --     vim.cmd("colorscheme dracula")
        -- end,
    },
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local fm = require 'fluoromachine'

            fm.setup {
                glow = true,
                theme = 'fluoromachine',
                transparent = true,
            }

            -- vim.cmd.colorscheme 'fluoromachine'
        end
    }
}
