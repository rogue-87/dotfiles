return {
	"mrcjkb/rustaceanvim",
	-- enabled = false,
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
}

-- NOTE: Fallback

-- return {
-- 	-- lsp
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		optional = true,
-- 		ft = { "rust" },
-- 		opts = function()
-- 			local lspconfig = require("lspconfig")
-- 			lspconfig["rust_analyzer"].setup({})
-- 		end,
-- 	},
-- 	-- formatter
-- 	{
-- 		"stevearc/conform.nvim",
-- 		optional = true,
-- 		ft = { "rust" },
-- 		opts = function()
-- 			require("conform").setup({
-- 				formatters_by_ft = {
-- 					rust = { "rustfmt", lsp_format = "fallback" },
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	-- debugger
-- 	{
-- 		"mfussenegger/nvim-dap",
-- 		optional = true,
-- 		ft = { "rust" },
-- 		dependencies = {
-- 			"williamboman/mason.nvim", -- codelldb
-- 		},
-- 		opts = function()
-- 			local dap = require("dap")
-- 			dap.adapters.codelldb = {
-- 				type = "server",
-- 				port = "${port}",
-- 				executable = {
-- 					command = "codelldb",
-- 					args = { "--port", "${port}" },
-- 					-- detached = false, -- On windows you may have to uncomment this.
-- 				},
-- 			}
--
-- 			dap.configurations.rust = {
-- 				{
-- 					name = "Debug Rust",
-- 					type = "codelldb",
-- 					request = "launch",
-- 					program = function()
-- 						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 					end,
-- 					cwd = "${workspaceFolder}",
-- 					stopOnEntry = false,
-- 				},
-- 			}
-- 		end,
-- 	},
-- }
