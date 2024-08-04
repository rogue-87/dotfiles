return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },

				html = { "prettier" },
				vue = { "prettier" },
				astro = { "prettier" },
				markdown = { "prettier" },

				css = { "prettier" },
				scss = { "prettier" },

				json = { "prettier" },
				yaml = { "prettier" },

				lua = { "stylua" },
				bash = { "shfmt" },
				go = { "gofmt" },
			},
		})

		conform.formatters.prettier = {
			args = function(self, ctx)
				if vim.endswith(ctx.filename, ".astro") then
					return {
						"--stdin-filepath",
						"$FILENAME",
						"--plugin",
						"prettier-plugin-astro",
						--[[ "--plugin",
								"prettier-plugin-tailwindcss", ]]
					}
				end
				return {
					"--stdin-filepath",
					"$FILENAME", --[[ "--plugin", "prettier-plugin-tailwindcss" ]]
				}
			end,
		}

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
