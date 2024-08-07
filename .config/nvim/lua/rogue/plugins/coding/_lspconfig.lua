local client = require("vim.lsp.client")
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		local lspconfig = require("lspconfig")
		local mason_registry = require("mason-registry")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Manually installed LSPs
		lspconfig["fish_lsp"].setup({
			cmd = { "fish-lsp", "start" },
			filetypes = { "fish" },
		})

		-- The one and only
		require("mason").setup({
			ui = {
				border = "none",
				width = 0.8,
				height = 0.8,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		-- LSPs installed using mason.nvim
		require("mason-lspconfig").setup({
			-- LSPs
			ensure_installed = {
				-- Web
				"html",
				"cssls",
				"tsserver",
				"jsonls",
				"astro",
				"volar",
				"emmet_language_server",

				-- Generic
				"lua_ls",
				"bashls",
				"gopls",
			},
			automatic_installation = true,
			handlers = {
				-- Default config for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						on_init = function(client)
							local path = client.workspace_folders[1].name
							if
								vim.loop.fs_stat(path .. "/.luarc.json")
								or vim.loop.fs_stat(path .. "/.luarc.jsonc")
							then
								return
							end
							client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										-- Depending on the usage, you might want to add additional paths here.
										-- "${3rd}/luv/library"
										-- "${3rd}/busted/library",
									},
									-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
									-- library = vim.api.nvim_get_runtime_file("", true)
								},
							})
						end,
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
				["gopls"] = function()
					lspconfig["gopls"].setup({
						cmd = { "gopls" },
						capabilities = capabilities,
						filetypes = { "go", "gomod", "gowork", "gotmpl" },
						single_file_support = true,
					})
				end,
				-- Web dev stuff
				["html"] = function()
					lspconfig["html"].setup({
						capabilities = capabilities,
						filetypes = { "html", "templ" },
						init_options = {
							configurationSection = { "html", "css", "javascript" },
							embeddedLanguages = {
								css = true,
								javascript = true,
							},
							provideFormatter = false,
						},
						single_file_support = true,
					})
				end,
				["cssls"] = function()
					lspconfig["cssls"].setup({
						capabilities = capabilities,
					})
				end,
				["css_variables"] = function()
					lspconfig["css_variables"].setup({})
				end,
				["cssmodules_ls"] = function()
					lspconfig["cssmodules_ls"].setup({})
				end,
				["emmet_language_server"] = function()
					lspconfig["emmet_language_server"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"scss",
						},
					})
				end,
				["tsserver"] = function()
					local vue_plugin = os.getenv("HOME") .. "/.npm/packages/lib/node_modules/@vue/typescript-plugin/"
					lspconfig["tsserver"].setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_plugin,
									languages = { "javascript", "typescript", "vue" },
								},
							},
						},
						filetypes = {
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
						},
						on_attach = function(client, bufnr) end,
					})
				end,
				["volar"] = function()
					local ts_lib_mason = mason_registry.get_package("vue-language-server"):get_install_path()
						.. "/node_modules/typescript/lib"
					local ts_lib_npm = os.getenv("HOME") .. "/.npm/packages/lib/node_modules/typescript/lib/"

					lspconfig["volar"].setup({
						init_options = {
							typescript = {
								tsdk = ts_lib_mason,
							},
						},
						filetypes = { "vue" },
					})
				end,
				["astro"] = function()
					lspconfig["astro"].setup({
						capabilities = capabilities,
						on_attach = function() end,
						filetypes = { "astro" },
					})
				end,
				-- End of Web dev stuff
			},
		})

		-- Formatters, Linters.
		require("mason-tool-installer").setup({
			-- Formatters, Linters
			ensure_installed = {
				-- Fomratters
				"stylua",
				"prettier",
				"shfmt",

				-- Linters
				"selene",
				"codespell",
				"stylelint",
				"eslint_d",

				-- Both
			},
			auto_update = false,
		})

		-- For installing & configuring Daps
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"node2",
				"js",
			},
			automatic_installation = false,
		})

		local map = vim.keymap.set
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- [[ Telescope ]]
				opts.desc = "Show LSP references"
				map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "Show buffer diagnostics"
				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				-- end of Telescope

				-- [[ vim.lsp ]]
				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				map("n", "<leader>vrn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Lsp Help Signature"
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
				-- end of vim.lsp

				-- [[ vim.diagnostics ]]
				opts.desc = "Show line diagnostics"
				map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				-- end of vim.diagnostics

				-- [[ Extras ]]
				-- end of Extras
			end,
		})
	end,
}
