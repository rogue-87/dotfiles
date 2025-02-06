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
	-- stylua: ignore
	keys = {
		{ "<leader>ff", function()  require("telescope.builtin").find_files({ hidden = true })  end, desc = "Fuzzy find files in cwd" },
    	{ "<leader>fr", function()  require("telescope.builtin").oldfiles()                     end, desc = "Fuzzy find recent files" },
    	{ "<leader>fs", function()  require("telescope.builtin").live_grep()                    end, desc = "Find string in cwd" },
    	{ "<leader>fS", function()  require("telescope.builtin").symbols()                      end, desc = "Find symbols" },
    	{ "<leader>fb", function()  require("telescope.builtin").buffers()                      end, desc = "Find buffers" },
    	{ "<leader>fg", function()  require("telescope.builtin").grep_string()                  end, desc = "Find string under cursor in cwd" },
    	{ "<leader>fc", function()  require("telescope.builtin").colorscheme()                  end, desc = "Select colorscheme" },
    	{ "<leader>fh", function()  require("telescope.builtin").help_tags()                    end, desc = "Help tags" },
    	{ "<leader>gc", function()  require("telescope.builtin").git_commits()                  end, desc = "Commits" },
    	{ "<leader>gs", function()  require("telescope.builtin").git_status()                   end, desc = "Status" },
    	{ "<leader>gs", function()  require("telescope.builtin").find_files()                   end, desc = "Status" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
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
						["<C-k>"] = actions.move_selection_previous, --move to prev result
						["<C-j>"] = actions.move_selection_next, --move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<S-o>"] = function()
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
