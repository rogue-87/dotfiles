local utils = require("myutils")
local lsp = require("myutils.lsp")
---@type vim.keymap.set.Opts
local opts = { noremap = true, silent = true }

-- Clipboard related stuff
-- DELETE
utils.map({ "n", "v" }, "d", '"_d', opts)
-- DELETE LINE
utils.map("n", "dd", '"_dd', opts)
-- DELETE TILL END OF LINE
utils.map("n", "D", '"_D', opts)

-- CHANGE
utils.map({ "n", "v" }, "c", '"_c', opts)
-- CHANGE LINE
utils.map("n", "cc", '"_cc', opts)
-- CHANGE TILL END OF LINE
utils.map("n", "C", '"_C', opts)

-- CUT
utils.map({ "n", "v" }, "x", "d", opts)
-- CUT LINE
utils.map("n", "xx", "dd", opts)
-- CUT TILL END OF LINE
utils.map("n", "X", "D", opts)

-- SELECT
utils.map({ "n", "v" }, "s", '"_s', opts)
-- SELECT LINE
utils.map("n", "S", '"_S', opts)

-- Actual Keymaps
opts.desc = "write file"
utils.map("n", "<leader>ww", "<cmd>w<cr>", opts)

opts.desc = "write all files"
utils.map("n", "<leader>wa", "<cmd>wa<cr>", opts)

opts.desc = "nohlsearch"
utils.map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

opts.desc = "quit/session"
utils.map("n", "<leader>q", "", opts)

opts.desc = "quit & save"
utils.map("n", "<leader>qq", "<cmd>wqa<cr>", opts)

opts.desc = "quit witout saving"
utils.map("n", "<leader>qQ", "<cmd>qa!<cr>", opts)

opts.desc = "Lazy"
utils.map("n", "<leader>ml", "<cmd>Lazy<cr>", opts)

utils.map("n", "<A-n>", "<cmd>tabnew<cr>", opts)
utils.map("n", "<A-c>", "<cmd>tabclose<cr>", opts)
utils.map("n", "<A-.>", "<cmd>tabn<cr>", opts)
utils.map("n", "<A-,>", "<cmd>tabp<cr>", opts)
utils.map("n", "<C-,>", "<cmd>-tabmove<cr>", opts)
utils.map("n", "<C-.>", "<cmd>+tabmove<cr>", opts)

-- NOTE: LSP related mappings
lsp.on_attach(function(client, bufnr)
	local ls_opts = { buffer = bufnr }

	if client.server_capabilities.hoverProvider then
		utils.map("n", "K", function()
			vim.lsp.buf.hover()
		end, ls_opts, "get hover info")
	end

	if client.server_capabilities.signatureHelpProvider then
		utils.map("n", "<localleader>k", vim.lsp.buf.signature_help, ls_opts, "get fn signature help")
	end

	if client.server_capabilities.declarationProvider then
		utils.map("n", "<localleader>gD", vim.lsp.buf.declaration, ls_opts, "goto declaration")
	end

	if client.server_capabilities.definitionProvider then
		-- vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
		utils.map("n", "<localleader>gd", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga goto_definition]])
			else
				vim.lsp.buf.definition()
			end
		end, ls_opts, "goto definition")

		if utils.has("lspsaga.nvim") then
			utils.map("n", "<localleader>pd", function()
				vim.cmd([[Lspsaga peek_definition]])
			end, ls_opts, "peek definition")
		end
	end

	if client.server_capabilities.typeDefinitionProvider then
		utils.map("n", "<localleader>gt", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga goto_type_definition]])
			else
				vim.lsp.buf.type_definition()
			end
		end, ls_opts, "goto type definition")

		if utils.has("lspsaga.nvim") then
			utils.map("n", "<localleader>pt", function()
				vim.cmd([[Lspsaga peek_type_definition]])
			end, ls_opts, "peek type definition")
		end
	end

	if client.server_capabilities.implementationProvider then
		utils.map("n", "<localleader>gi", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga finder imp+def]])
			elseif utils.has("snacks.nvim") then
				---@diagnostic disable-next-line: undefined-global
				Snacks.picker.lsp_implementations()
			else
				vim.lsp.buf.implementation()
			end
		end, ls_opts, "goto type implementation")
	end

	if client.server_capabilities.referencesProvider then
		utils.map("n", "<localleader>gr", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga finder ref]])
			elseif utils.has("snacks.nvim") then
				Snacks.picker.lsp_references()
			else
				vim.lsp.buf.references()
			end
		end, ls_opts, "goto type references")
	end

	if client.server_capabilities.documentSymbolProvider then
		utils.map("n", "<localleader>ds", vim.lsp.buf.document_symbol, ls_opts, "document symbols")
	end

	if client.server_capabilities.codeActionProvider then
		utils.map({ "n", "v" }, "<localleader>ca", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga code_action]])
			else
				vim.lsp.buf.code_action()
			end
		end, ls_opts, "code action")
	end

	if client.server_capabilities.documentFormattingProvider then
		if utils.has("conform.nvim") then
			utils.map({ "n", "v" }, "<localleader>f", function()
				require("conform").format({ async = true })
			end, ls_opts, "format code")
		else
			utils.map({ "n", "v" }, "<localleader>f", function()
				vim.lsp.buf.format({ async = true })
			end, ls_opts, "lsp format")
		end
	end

	if client.server_capabilities.renameProvider then
		utils.map("n", "<localleader>rn", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga rename]])
			else
				vim.lsp.buf.rename()
			end
		end, ls_opts, "rename symbol")
	end

	if client.server_capabilities.callHierarchyProvider then
		utils.map("n", "<localleader>ci", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga incoming_calls]])
			else
				vim.lsp.buf.incoming_calls()
			end
		end, ls_opts, "incoming calls")

		utils.map("n", "<localleader>co", function()
			if utils.has("lspsaga.nvim") then
				vim.cmd([[Lspsaga outgoing_calls]])
			else
				vim.lsp.buf.outgoing_calls()
			end
		end, ls_opts, "outgoing calls")
	end

	if client.server_capabilities.workspaceSymbolProvider then
		utils.map("n", "<localleader>ws", vim.lsp.buf.workspace_symbol, ls_opts, "list workspace symbols")
	end

	-- NOTE: Toggles
	if client.server_capabilities.documentHighlightProvider then
		Snacks.toggle.words():map("<localleader>uw")
	end

	if client.server_capabilities.diagnosticProvider then
		Snacks.toggle.diagnostics():map("<localleader>ud")
	end

	if client.server_capabilities.inlayHintProvider then
		Snacks.toggle.inlay_hints():map("<localleader>uh")
	end

	if client.server_capabilities.semanticTokensProvider then
		vim.g.enable_semantic_tokens = true
		local semantic_tokens_toggle = Snacks.toggle.new({
			id = "semantic tokens",
			name = "semantic tokens",
			get = function()
				return vim.g.enable_semantic_tokens
			end,
			set = function(state)
				if state then
					vim.lsp.semantic_tokens.start(bufnr, client.id)
				else
					vim.lsp.semantic_tokens.stop(bufnr, client.id)
				end
			end,
		})
		semantic_tokens_toggle:map("<localleader>us")
	end

	utils.map("n", "[d", function()
		if utils.has("lspsaga.nvim") then
			vim.cmd([[Lspsaga diagnostic_jump_prev]])
		else
			vim.diagnostic.jump({ count = -1, float = true })
		end
	end, ls_opts, "goto previous diagnostics")
	utils.map("n", "]d", function()
		if utils.has("lspsaga.nvim") then
			vim.cmd([[Lspsaga diagnostic_jump_next]])
		else
			vim.diagnostic.jump({ count = 1, float = true })
		end
	end, ls_opts, "goto next diagnostics")

	if utils.has("lspsaga.nvim") then
		utils.map("n", "<localleader>wd", function()
			vim.cmd([[Lspsaga show_workspace_diagnostics]]) --can use ++normal to show in loclist
		end, ls_opts, "workspace diagnostics")
		utils.map("n", "<localleader>bd", function()
			vim.cmd([[Lspsaga show_buf_diagnostics]])
		end, ls_opts, "buffer diagnostics")
		utils.map("n", "<localleader>ld", function()
			vim.cmd([[Lspsaga show_line_diagnostics]])
		end, ls_opts, "line diagnostics")
		utils.map("n", "<localleader>wo", function()
			vim.cmd([[Lspsaga outline]])
		end, ls_opts, "workspace outline")
	else
		utils.map("n", "<localleader>ld", vim.diagnostic.open_float, ls_opts, "line diagnostics")
	end
	utils.map("n", "<localleader>sl", vim.diagnostic.setloclist, ls_opts, "set loclist")

	utils.map("n", "<localleader>wf", function()
		vim.print(vim.lsp.buf.list_workspace_folders())
	end, ls_opts, "list workspace folders")
	utils.map("n", "<localleader>cd", function()
		vim.notify("Language server " .. (vim.lsp.status() and "is ready" or "is not ready"), vim.log.levels.INFO)
	end, ls_opts, "check if lsp is ready")
end)
