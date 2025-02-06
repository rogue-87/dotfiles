return { -- Lsp Config
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
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
	-- stylua: ignore
	keys = {
		{ "<leader>cla", 	"",					desc = "Actions",   },
		{ "<leader>clas", 	":LspStart ",		desc = "Start",		},
		{ "<leader>clat", 	":LspStop ",		desc = "Stop",		},
		{ "<leader>clar", 	":LspRestart<cr>",	desc = "Restart",	},
		{ "<leader>clai", 	":LspInfo<cr>",		desc = "Info",		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("rogue.util.capabilities").get()

		lspconfig["bashls"].setup({})

		lspconfig["lua_ls"].setup({
			-- capabilities = capabilities,
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if vim.uv.fs_stat(path .. "/.luarc.json") then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = { version = "LuaJIT" },
					telemetry = { enable = false },
					workspace = {
						library = {
							vim.env.VIMRUNTIME,
							"${3rd}/luv/library",
							"${3rd}/busted/library",
						},
						checkThirdParty = false,
					},
				})
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		lspconfig["jsonls"].setup({
			filetypes = { "json", "jsonc" },
			capabilities = capabilities,
			settings = {
				json = {
					-- Schemas https://www.schemastore.org
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local map = vim.keymap.set
				local opts = { buffer = ev.buf, silent = true }
				map("n", "<leader>cl", "", { desc = "lsp" })

				opts.desc = "Show LSP definitions"
				map("n", "<leader>clD", "<cmd>Telescope lsp_definitions<cr>", opts)

				opts.desc = "Show LSP references"
				map("n", "<leader>clr", "<cmd>Telescope lsp_references<cr>", opts)

				opts.desc = "Show LSP implementations"
				map("n", "<leader>cli", "<cmd>Telescope lsp_implementations<cr>", opts)

				opts.desc = "Show LSP type definitions"
				map("n", "<leader>clt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

				opts.desc = "LSP Go to declaration"
				map("n", "<leader>cld", vim.lsp.buf.declaration, opts)

				opts.desc = "Show line diagnostics"
				map("n", "<leader>cd", vim.diagnostic.open_float, opts)

				opts.desc = "Show buffer diagnostics"
				map("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				map("n", "<leader>cr", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Lsp Help Signature"
				map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts)
			end,
		})
	end,
}
