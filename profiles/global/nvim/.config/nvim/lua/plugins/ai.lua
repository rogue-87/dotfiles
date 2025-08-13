---@type LazySpec
return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "echasnovski/mini.diff",
		},
		opts = {
			adapters = {
				opts = { show_defaults = false },
				["qwen3-coder"] = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "qwen3-coder",
						opts = { vision = true, stream = true },
						schema = {
							model = { default = "qwen3-coder:latest" },
							num_ctx = { default = 16384 },
							think = { default = false },
							keep_alive = { default = "5m" },
						},
					})
				end,
				["gemma3"] = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "gemma3",
						opts = { vision = true, stream = true },
						schema = {
							model = { default = "gemma3:latest" },
							num_ctx = { default = 16384 },
							think = { default = false },
							keep_alive = { default = "50m" },
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "gemma3" },
				inline = { adapter = "gemma3" },
				cmd = { adapter = "gemma3" },
			},
			display = {
				chat = {
					-- Change the default icons
					icons = { buffer_pin = " ", buffer_watch = "👀 " },
					window = {
						layout = "vertical",
						position = "right",
						border = "single",
						height = 0.8,
						width = 0.45,
						relative = "editor",
						full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
						sticky = false, -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
						opts = {
							breakindent = true,
							cursorcolumn = false,
							cursorline = false,
							foldcolumn = "0",
							linebreak = true,
							list = false,
							numberwidth = 1,
							signcolumn = "no",
							spell = false,
							wrap = true,
						},
					},
				},
				action_palette = {
					width = 95,
					height = 10,
					prompt = "Prompt ", -- Prompt used for interactive LLM calls
					provider = "snacks", ---@type "default"|"telescope"|"fzf_lua"|"mini_pick"|"snacks"
					opts = {
						show_default_actions = true, -- Show the default actions in the action palette?
						show_default_prompt_library = true, -- Show the default prompt library in the action palette?
						title = "CodeCompanion actions", -- The title of the action palette
					},
				},
			},
		},
	},
	-- copy images from your system clipboard into a chat buffer
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},
	-- code completion
	{
		"Saghen/blink.cmp",
		optional = true,
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
			},
		},
	},
}
