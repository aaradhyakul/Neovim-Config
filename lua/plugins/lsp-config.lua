local Map = require("vim-options").Map
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.clangd.setup({})
			--vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			--vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
			Map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
			Map("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
			Map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
			Map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			Map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>")
		end,
	},
}
