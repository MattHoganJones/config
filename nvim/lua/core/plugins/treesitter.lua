local M = 
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-endwise",
        "mfussenegger/nvim-ts-hint-textobject",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            indent = { enable = true },
            autopairs = { enable = true },
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    scope_incremental = "<CR>",
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ib"] = "@block.inner",
                        ["ab"] = "@block.outer",
                        ["ir"] = "@parameter.inner",
                        ["ar"] = "@parameter.outer",
                    },
                },
            },
        })

        require("nvim-ts-autotag").setup()

    end,
}

return { M }
