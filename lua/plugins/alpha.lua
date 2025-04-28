return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		-- available: devicons, mini, default is mini
		-- if provider not loaded and enabled is true, it will try to use another provider
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)

		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
[[   ,---,                                                  ,---,                           ]],
[[  '  .' \                                          ,---,,--.' |                           ]],
[[ /  ;    '.                 __  ,-.              ,---.'||  |  :                           ]],
[[:  :       \              ,' ,'/ /|              |   | ::  :  :                           ]],
[[:  |   /\   \    ,--.--.  '  | |' | ,--.--.      |   | |:  |  |,--.     .--,   ,--.--.    ]],
[[|  :  ' ;.   :  /       \ |  |   ,'/       \   ,--.__| ||  :  '   |   /_ ./|  /       \   ]],
[[|  |  ;/  \   \.--.  .-. |'  :  / .--.  .-. | /   ,'   ||  |   /' :, ' , ' : .--.  .-. |  ]],
[['  :  | \  \ ,' \__\/: . .|  | '   \__\/: . ..   '  /  |'  :  | | /___/ \: |  \__\/: . .  ]],
[[|  |  '  '--'   ," .--.; |;  : |   ," .--.; |'   ; |:  ||  |  ' | :.  \  ' |  ," .--.; |  ]],
[[|  :  :        /  /  ,.  ||  , ;  /  /  ,.  ||   | '/  '|  :  :_:,' \  ;   : /  /  ,.  |  ]],
[[|  | ,'       ;  :   .'   \---'  ;  :   .'   \   :    :||  | ,'      \  \  ;;  :   .'   \ ]],
[[`--''         |  ,     .-./      |  ,     .-./\   \  /  `--''         :  \  \  ,     .-./ ]],
[[               `--`---'           `--`---'     `----'                  \  ' ;`--`---'     ]],
[[                                                                        `--`              ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			return "Stay humble!"
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
		vim.keymap.set({ "n", "t" }, "<leader>a", "<cmd>Alpha<cr>")
	end,
}
