return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
    {'jose-elias-alvarez/typescript.nvim'},
  },
  config = function()
	  local lsp = require('lsp-zero')
	  lsp.preset("recommended")

	  lsp.ensure_installed({
		  'tsserver',
		  'angularls',
		  'csharp_ls',
	  })


	  lsp.set_preferences({
		  suggest_lsp_servers = false,
		  sign_icons = {
			  error = 'E',
			  warn = 'W',
			  hint = 'H',
			  info = 'I'
		  }
	  })

	  lsp.on_attach(function(client, bufnr)
		  local opts = {buffer = bufnr, remap = false}

		  if client.name == "eslint" then
			  vim.cmd.LspStop('eslint')
			  return
		  end

		  --vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		  vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, opts)
		  vim.keymap.set("n", "<leader>vri", vim.lsp.buf.implementation, opts)
		  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
		  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		  --vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		  vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
		  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		  vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
		  vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
	  end)

	  local util = require('lspconfig.util')

	  lsp.configure('angularls', {
		  root_dir = util.root_pattern('angular.json', 'project.json')
	  })

	  lsp.setup()

	  vim.diagnostic.config({
		  virtual_text = true,
	  })

	  require("typescript").setup({
		  disable_commands = false,
		  debug = false,
		  go_to_source_definition = {
			  fallback = true,
		  },
		  server = {
			  on_attach = on_attach
		  },
	  })
  end
}
