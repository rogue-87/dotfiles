return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[            :::::::::       ::::::::       ::::::::      :::    :::       ::::::::::    ]],
			[[           :+:    :+:     :+:    :+:     :+:    :+:     :+:    :+:       :+:            ]],
			[[          +:+    +:+     +:+    +:+     +:+            +:+    +:+       +:+             ]],
			[[         +#++:++#:      +#+    +:+     :#:            +#+    +:+       +#++:++#         ]],
			[[        +#+    +#+     +#+    +#+     +#+   +#+#     +#+    +#+       +#+               ]],
			[[       #+#    #+#     #+#    #+#     #+#    #+#     #+#    #+#       #+#                ]],
			[[      ###    ###      ########       ########       ########        ##########          ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <cr>"),

			dashboard.button(
				"f",
				"󰍉  Find Files",
				"<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>"
			),

			dashboard.button(
				"s",
				"  Open Last Session",
				"<cmd>lua require('persistence').load({ last = true })<cr>"
			),

			dashboard.button("r", "  Recent Sessions", "<cmd>lua require('persistence').select()<cr>"),

			dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),

			dashboard.button("m", "  Mason", "<cmd>Mason<cr>"),
		  -- stylua: ignore
		  dashboard.button("c", "  Config", "<cmd>lua vim.fn.chdir(vim.fn.stdpath('config'))<cr>" .. "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>"),

			dashboard.button("h", "󰓙  Run healthcheck", "<cmd>checkhealth<cr>"),

			dashboard.button("q", "󰗼  Quit Neovim", "<cmd>qa<cr>"),
		}
		alpha.setup(dashboard.config)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "󱐋 Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
