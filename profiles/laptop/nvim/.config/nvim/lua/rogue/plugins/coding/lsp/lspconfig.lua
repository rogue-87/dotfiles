return { -- Lsp Config
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
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
		{ "williamboman/mason-lspconfig.nvim" },
	},
	-- stylua: ignore
	keys = {
		{ "<leader>cla", 	"",						desc = "Actions",   },
		{ "<leader>clas", 	":LspStart ",			desc = "Start",		},
		{ "<leader>clat", 	":LspStop ",			desc = "Stop",		},
		{ "<leader>clar", 	"<cmd>LspRestart<cr>",	desc = "Restart",	},
		{ "<leader>clai", 	"<cmd>LspInfo<cr>",		desc = "Info",		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local msn_lspconf = require("mason-lspconfig")

		-- LSPs INSTALLED & MANAGED BY MASON.NVIM
		msn_lspconf.setup({
			-- LSPs
			ensure_installed = {
				"bashls",
				"lua_ls",
			},
			automatic_installation = false,
			handlers = {
				-- DEFAULT CONFIG FOR ALL SERVERS
				--[[ function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end, ]]
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
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
				end,
				["bashls"] = function()
					lspconfig["bashls"].setup({})
				end,
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
