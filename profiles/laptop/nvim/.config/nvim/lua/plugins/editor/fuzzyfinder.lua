return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-symbols.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = { "BufReadPre", "BufNewFile" },
	branch = "0.1.x",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fS", "<cmd>Telescope symbols<cr>", desc = "Find symbols" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fg", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Select colorscheme" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			pickers = {
				colorscheme = { enable_preview = true },
			},
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"dist",
					".git",
					".env",
					"*.lock",
				},
				mappings = {
					i = {
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-o>"] = function()
							local entry = require("telescope.actions.state").get_selected_entry()
							vim.ui.open(entry[1])
						end,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
