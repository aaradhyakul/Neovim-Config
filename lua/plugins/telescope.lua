local vim_opts = require("vim-options")
local Map = vim_opts.Map
return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			Map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
			Map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
			Map("n", "<leader>fe", "<cmd> Telescope file_browser <CR>")
			Map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
			Map("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
			Map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
			Map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
			Map("n", "<leader>fc", "<cmd> Telescope colorschemes <CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
