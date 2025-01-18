return { -- Completion Core
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		{ -- Snippet Engine
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	config = function()
		local cmp = require("cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local handlers = require("nvim-autopairs.completion.handlers")
		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				filetypes = {
					-- "*" is a alias to all filetypes
					["*"] = {
						["("] = {
							kind = {
								cmp.lsp.CompletionItemKind.Function,
								cmp.lsp.CompletionItemKind.Method,
							},
							handler = handlers["*"],
						},
					},
					lua = {
						["("] = {
							kind = {
								cmp.lsp.CompletionItemKind.Function,
								cmp.lsp.CompletionItemKind.Method,
							},
							---@param char string
							---@param item table item completion
							---@param bufnr number buffer number
							---@param rules table
							---@param commit_character table<string>
							handler = function(char, item, bufnr, rules, commit_character)
								-- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
							end,
						},
					},
					-- Disable for tex
					tex = false,
				},
			})
		)

		local lspkind = require("lspkind")
		cmp.setup({
			completion = {
				-- autocomplete = false,
				-- defer = 50,
				keyword_length = 2,
				get_trigger_characters = function()
					local filetype = vim.bo.filetype
					local triggers = {
						lua = { ".", ":" },
						html = { "<", "/" },
						css = { ":", ".", "#", "@" },
						scss = { ":", ".", "#", "@" },
						javascript = { ".", "=>", "import ", "from " },
						typescript = { ".", "=>", "import ", "from " },
						-- javascriptreact = { ".", ">", "{" },
						-- typescriptreact = { ".", ">", "{" },
						python = { ".", "import ", "from " },
						astro = { "<", "/", ":", ".", "#", "@", ".", "=>", "import ", "from " },
						svelte = { "<", "/", ":", ".", "#", "@", ".", "=>", "import ", "from " },
						rust = { ".", "::" },
					}

					-- return filetype trigger or fallback to '.'
					return triggers[filetype] or { "." }
				end,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}),
			formatting = {
				expandable_indicator = true,
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
