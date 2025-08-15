return {
	"folke/snacks.nvim",
	-- version = "*",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = { header = utils.ascii.rogue },
		},
		explorer = { enabled = false },
		indent = {
			enabled = true,
			animate = { enabled = false },
			filter = function(buf)
				-- stylua: ignore
				if vim.bo[buf].filetype == "markdown" then return end

				return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
			end,
		},
		input = { enabled = true },
		image = { enabled = true },
		notifier = {
			enabled = true,
			-- INFO: disable if you want to customize the notifier
			-- style = "minimal", ---@type snacks.notifier.style
			top_down = false,
			margin = { top = 0, right = 0, bottom = 0 },
		},
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },

		styles = {
			notification = {
				backdrop = false,
				border = "none",
				focusable = false,
				ft = "markdown",
				relative = "editor",
			},
		},
	},
	-- stylua: ignore
	keys = {
		-- Find
		{ "<leader>fb", function() Snacks.picker.buffers() 									end, desc = "Find buffers" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") })	end, desc = "Find Config File" },
		{ "<leader>ff", function() Snacks.picker.files() 									end, desc = "Fuzzy find files in cwd" },
		{ "<leader>fF", function() Snacks.picker.files({ hidden = true }) 					end, desc = "Fuzzy find files in cwd (inlcuding hidden)" },
		{ "<leader>fg", function() Snacks.picker.git_files() 								end, desc = "Find Git Files" },
		{ "<leader>fp", function() Snacks.picker.projects() 								end, desc = "Projects" },
		{ "<leader>fr", function() Snacks.picker.recent() 									end, desc = "Fuzzy find recent files" },
		-- Grep
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sb", function() Snacks.picker.lines() 		end, desc = "Buffer Lines" },
		{ "<leader>sg", function() Snacks.picker.grep() 		end, desc = "Grep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() 	end, desc = "Visual selection or word", mode = { "n", "x" } },
		-- Search
		{ "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		{ "<leader>sh", function() Snacks.picker.help() 		end, desc = "Help Pages" },
		{ "<leader>si", function() Snacks.picker.icons() 		end, desc = "Icons" },
		{ "<leader>sl", function() Snacks.picker.loclist() 		end, desc = "Location List" },
		-- Notifier
		{ "<leader>n", "",																	desc = "notifications"	},
		{ "<leader>nh",	function() Snacks.notifier.show_history()					end,	desc = "History"		},
		{ "<leader>ne",	function() Snacks.notifier.show_history({filter = "error"})	end,	desc = "Errors"			},
		{ "<leader>ni",	function() Snacks.notifier.show_history({filter = "info"})	end,	desc = "Info"			},
		{ "<leader>nw",	function() Snacks.notifier.show_history({filter = "warn"})	end,	desc = "Warn"			},
		{ "<c-esc>",   	function() Snacks.notifier.hide()							end,	desc = "Dismiss"  		},
		-- Terminal
		{ "<c-/>",      function() Snacks.terminal.toggle(nil, { interactive = true, win = { height = 5, }}) 	end, desc = "Toggle Terminal" },
		{ "<leader>rb", function() Snacks.terminal("btop", { win = { position = "float" } }) 	                end, desc = "Btop" },
		{ "<leader>rh", function() Snacks.terminal("htop", { win = { position = "float" } }) 	                end, desc = "Htop" },
		{ "<leader>rg", function() Snacks.lazygit() 											                end, desc = "Lazygit" },
		-- Other
		{ "[[",         function() Snacks.words.jump(-vim.v.count1) 							end, desc = "Prev Reference", mode = { "n", "t" } },
		{ "]]",         function() Snacks.words.jump(vim.v.count1) 								end, desc = "Next Reference", mode = { "n", "t" } },
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0,
					height = 0,
					border = "none",
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				-- stylua: ignore
				_G.dd = function(...) Snacks.debug.inspect(...) end
				-- stylua: ignore
				_G.bt = function() Snacks.debug.backtrace() end
				vim.print = _G.dd -- Override print to use snacks for `:=` command
				-- Create some toggle mappings
				Snacks.toggle.dim():map("<leader>ud")
				Snacks.toggle.indent():map("<leader>ug")
				-- stylua: ignore
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
				Snacks.toggle.option("list", { name = "List" }):map("<leader>ul")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ur")
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.scroll():map("<leader>uS")
				Snacks.toggle.treesitter():map("<leader>ut")
				Snacks.toggle.words():map("<localleader>uw")
			end,
		})
	end,
}
