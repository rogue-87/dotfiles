local ascii = [[
      :::::::::       ::::::::       ::::::::      :::    :::       ::::::::::
     :+:    :+:     :+:    :+:     :+:    :+:     :+:    :+:       :+:        
    +:+    +:+     +:+    +:+     +:+            +:+    +:+       +:+         
   +#++:++#:      +#+    +:+     :#:            +#+    +:+       +#++:++#     
  +#+    +#+     +#+    +#+     +#+   +#+#     +#+    +#+       +#+           
 #+#    #+#     #+#    #+#     #+#    #+#     #+#    #+#       #+#            
###    ###      ########       ########       ########        ##########      
]]

return {
	"folke/snacks.nvim",
	priority = 1000,
	enabled = false,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				-- stylua: ignore
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = "	", key = "n", desc = "New File", 				action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", 				action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "s", desc = "Restore Last Session", 	section = "session" },
					{ icon = " ", key = "r", desc = "Recent Projects", 		action = ":lua Snacks.picker.projects()" },
					{ icon = " ", key = "c", desc = "Config", 					action = "<cmd>lua vim.fn.chdir(vim.fn.stdpath('config'))<cr>" .. "<cmd>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<cr>" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", 					action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = "🛠", key = "m", desc = "Mason,", 					action = ":Mason"},
					{ icon = "󰓙 ", key = "h", desc = "Healthcheck", 			action = ":checkhealth"},
					{ icon = " ", key = "q", desc = "Quit", 					action = ":qa" },
				},
				header = ascii,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		indent = { enabled = false },
		input = { enabled = false },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						cycle = false,
						layout = {
							minimal = true,
							position = "right",
						},
					},
				},
			},
		},
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "Explore" },
		{ "<leader>\\", "<cmd>lua Snacks.explorer.reveal()<cr>", desc = "Reveal file location in Filetree" },
	},
}
