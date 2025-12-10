---@type LazySpec
return {
	-- color highlight
	{
		-- For color highlighting
		"catgoose/nvim-colorizer.lua",
		opts = {
			lazy_load = true,
			filetypes = { "*", "!popup", "!lazy", "!noice", "!snacks_terminal" },
			user_default_options = {
				mode = "background", ---@type "foreground"|"background"|"virtualtext"
				tailwind = true, ---@type true|false|"normal"|"lsp"|"both"
				virtualtext = "󰝤",
				always_update = true,
			},
		},
	},
	-- scrollbar
	{
		"lewis6991/satellite.nvim",
		opts = {
			handlers = {
				cursor = { enable = true },
				gitsigns = { enable = true },
				marks = { enable = true },
				quickfix = { enable = true },
				diagnostic = { enable = true },
				search = { enable = true },
			},
		},
	},
	-- breadcrumbs
	{ "Bekaboo/dropbar.nvim", version = "*", opts = {} },
	-- git integration
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local opts = {}

				utils.map({ "n", "v" }, "<leader>g", "", opts, "git")
				utils.map({ "n", "v" }, "<leader>gh", "", opts, "hunk")

				opts.desc = "Next Hunk"
				utils.map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, opts)

				opts.desc = "Previous Hunk"
				utils.map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, opts)

				opts.desc = "Stage Hunk"
				utils.map("n", "<leader>ghs", gitsigns.stage_hunk, opts)

				opts.desc = "Reset Hunk"
				utils.map("n", "<leader>ghr", gitsigns.reset_hunk, opts)

				opts.desc = "Stage Hunk"
				utils.map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, opts)

				opts.desc = "Reset Hunk"
				utils.map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, opts)

				opts.desc = "Stage Buffer"
				utils.map("n", "<leader>ghS", gitsigns.stage_buffer, opts)

				opts.desc = "Reset Buffer"
				utils.map("n", "<leader>ghR", gitsigns.reset_buffer, opts)

				opts.desc = "Preview Hunk"
				utils.map("n", "<leader>ghp", gitsigns.preview_hunk, opts)

				opts.desc = "Preview Hunk Inline"
				utils.map("n", "<leader>ghi", gitsigns.preview_hunk_inline, opts)

				opts.desc = "Blame Line"
				utils.map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, opts)

				opts.desc = "Blame"
				utils.map("n", "<leader>gB", gitsigns.blame, opts)

				opts.desc = "Diff This"
				utils.map("n", "<leader>gd", gitsigns.diffthis, opts)

				opts.desc = "Diff This ~"
				utils.map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, opts)

				opts.desc = "Set Quickfix List"
				utils.map("n", "<leader>hq", gitsigns.setqflist, opts)

				opts.desc = "Set Quickfix List All"
				utils.map("n", "<leader>gQ", function()
					gitsigns.setqflist("all")
				end, opts)
			end,
		},
	},
}
