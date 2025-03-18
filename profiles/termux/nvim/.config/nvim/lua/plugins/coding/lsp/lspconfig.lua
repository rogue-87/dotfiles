return { -- Lsp Config
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
			cmd = "Mason",
			keys = {
				{ "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" },
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("config.utils").lsp.capabilities.get()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig["bashls"].setup({})

		lspconfig["lua_ls"].setup({
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							"${3rd}/luv/library",
							"${3rd}/busted/library",
						},
					},
				})
			end,
			settings = { Lua = {} },
		})

		lspconfig["jsonls"].setup({ capabilities = capabilities })

		lspconfig["taplo"].setup({})
	end,
}
