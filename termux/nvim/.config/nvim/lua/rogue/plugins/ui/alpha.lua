local ascii = {
	["rogue"] = {
		[[            :::::::::       ::::::::       ::::::::      :::    :::       ::::::::::    ]],
		[[           :+:    :+:     :+:    :+:     :+:    :+:     :+:    :+:       :+:            ]],
		[[          +:+    +:+     +:+    +:+     +:+            +:+    +:+       +:+             ]],
		[[         +#++:++#:      +#+    +:+     :#:            +#+    +:+       +#++:++#         ]],
		[[        +#+    +#+     +#+    +#+     +#+   +#+#     +#+    +#+       +#+               ]],
		[[       #+#    #+#     #+#    #+#     #+#    #+#     #+#    #+#       #+#                ]],
		[[      ###    ###      ########       ########       ########        ##########          ]],
	},
}

local plugin = {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = ascii["rogue"]
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <cr>"),

			dashboard.button(
				"f",
				"󰍉  Find files",
				"<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>"
			),

			dashboard.button(
				"s",
				"  Open last session",
				"<cmd>lua require('persistence').load({ last = true })<cr>"
			),

			dashboard.button("r", "  recent sessions", "<cmd>lua require('persistence').select()<cr>"),

			dashboard.button("l", "󰒲  Open lazy menu", "<cmd>Lazy<cr>"),

			dashboard.button("m", " Open mason menu", "<cmd>Mason<cr>"),
      -- stylua: ignore
      dashboard.button("c", "  Go to dotfiles dir", "<cmd>lua vim.fn.chdir(vim.fn.stdpath('config'))<cr>" .. "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>"),

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
				dashboard.section.footer.val = "⚡ Neovim loaded "
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

return plugin
