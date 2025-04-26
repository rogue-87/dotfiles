return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		-- stylua: ignore
		keys = {
			{ "<leader>g", "", desc = "git" },
			{ "<leader>gb", function() package.loaded.gitsigns.blame_line({ full = true })  end, desc = "Blame line"                          },
			{ "<leader>gB", function() package.loaded.gitsigns.toggle_current_line_blame()  end, desc = "Toggle line blame"                   },
			{ "<leader>gp", function() package.loaded.gitsigns.preview_hunk()               end, desc = "Preview hunk"                        },
			{ "<leader>gd", function() package.loaded.gitsigns.diffthis()                   end, desc = "Diff this"                           },
			{ "<leader>gD", function() package.loaded.gitsigns.diffthis("~")                end, desc = "Diff this ~"                         },
			{ "<leader>gs", function() package.loaded.gitsigns.stage_hunk()                 end, desc = "Stage hunk"                          },
			{ "<leader>gS", function() package.loaded.gitsigns.stage_buffer()               end, desc = "Stage buffer"                        },
			{ "<leader>gu", function() package.loaded.gitsigns.undo_stage_hunk()            end, desc = "Unstage hunk"                        },
			{ "<leader>gr", function() package.loaded.gitsigns.reset_hunk()                 end, desc = "Reset hunk"                          },
			{ "<leader>gR", function() package.loaded.gitsigns.reset_buffer()               end, desc = "Reset buffer"                        },
			{ "<leader>gt", function() package.loaded.gitsigns.toggle_deleted()             end, desc = "Toggle Deleted"                      },
		},
		---@type Gitsigns.Config
		opts = {},
	},
	{
		-- For color highlighting
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			lazy_load = true,
			filetypes = {
				"*",
				"!popup",
				"!lazy",
				"!noice",
				"!neo-tree",
			},
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue or blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "background", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = false, -- Enable tailwind colors
				-- parsers can contain values used in |user_default_options|
				sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				virtualtext = "󰝤",
				-- update color values even if buffer is not focused
				-- example use: cmp_menu, cmp_docs
				always_update = true,
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		},
	},
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{
		"nvim-focus/focus.nvim",
		version = "*",
		opts = {},
		init = function()
			local ignore_filetypes = { "neo-tree" }
			local ignore_buftypes = { "nofile", "prompt", "popup" }

			local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

			vim.api.nvim_create_autocmd("WinEnter", {
				group = augroup,
				callback = function(_)
					if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
						vim.w.focus_disable = true
					else
						vim.w.focus_disable = false
					end
				end,
				desc = "Disable focus autoresize for BufType",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = augroup,
				callback = function(_)
					if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
						vim.b.focus_disable = true
					else
						vim.b.focus_disable = false
					end
				end,
				desc = "Disable focus autoresize for FileType",
			})
		end,
	},
}
