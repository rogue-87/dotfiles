return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "explore" },
		{ "<leader>\\", "<cmd>Neotree reveal<cr>", desc = "reveal file location in Filetree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	---@module "neo-tree"
	opts = {
		close_if_last_window = false,
		enable_git_status = true,
		enable_diagnostics = true,
		sort_case_insensitive = false,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = { "node_modlues" },
				-- uses glob style patterns
				hide_by_pattern = {},
				-- remains visible even if other settings would normally hide it
				always_show = {},
				-- uses glob style patterns
				always_show_by_pattern = {},
				-- remains hidden even if visible is toggled to true, this overrides always_show
				never_show = {},
				-- uses glob style patterns
				never_show_by_pattern = {},
			},
			window = { mappings = { ["O"] = "system_open" } },
		},
		window = { position = "right", width = 36 },
		source_selector = { winbar = false, statusline = false },
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				-- macOs: open file in default application in the background.
				vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
				-- Linux: open file in default application
				vim.fn.jobstart({ "xdg-open", path }, { detach = true })

				-- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
				local p
				local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
				if lastSlashIndex then
					p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
				else
					p = path -- If no slash found, return original path
				end
				vim.cmd("silent !start explorer " .. p)
			end,
		},
	},
	config = function(_, opts)
		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end
		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
		})
		require("neo-tree").setup(opts)
	end,
}
