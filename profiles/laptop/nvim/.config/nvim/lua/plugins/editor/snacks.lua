return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		scroll = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		-- input = { enabled = true },
		picker = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	-- stylua: ignore
	keys = {
		{ "<leader>ff", function() Snacks.picker.files() 		end, desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", function() Snacks.picker.recent() 		end, desc = "Fuzzy find recent files" },
		{ "<leader>fs", function() Snacks.picker.grep() 		end, desc = "Find string in cwd" },
		{ "<leader>fi", function() Snacks.picker.icons() 		end, desc = "Find icons" },
		{ "<leader>fb", function() Snacks.picker.buffers() 		end, desc = "Find buffers" },
		{ "<leader>fg", function() Snacks.picker.grep_word() 	end, desc = "Find string under cursor in cwd" },
		{ "<leader>fc", function() Snacks.picker.colorschemes()	end, desc = "Select colorscheme" },
		{ "<leader>fh", function() Snacks.picker.help() 		end, desc = "Help tags" },
	},
}
