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

	if client:supports_method("textDocument/hover") then
		utils.map("n", "K", vim.lsp.buf.hover, ls_opts, "hover info")
	end

	if client:supports_method("textDocument/signatureHelp") then
		utils.map("n", "<localleader>k", vim.lsp.buf.signature_help, ls_opts, "signature help")
	end

	if client:supports_method("textDocument/declaration") then
		utils.map("n", "<localleader>gD", vim.lsp.buf.declaration, ls_opts, "goto declaration")
	end

	if client:supports_method("textDocument/definiition") then
		utils.map("n", "<localleader>gd", "<cmd>Lspsaga goto_definition<cr>", ls_opts, "goto definition")
		utils.map("n", "<localleader>pd", "<cmd>Lspsaga peek_definition<cr>", ls_opts, "peek definition")
	end

	if client:supports_method("textDocument/typeDefinition") then
		utils.map("n", "<localleader>gt", "<cmd>Lspsaga goto_type_definition<cr>", ls_opts, "goto type definition")
		utils.map("n", "<localleader>pt", "<cmd>Lspsaga peek_type_definition<cr>", ls_opts, "peek type definition")
	end

	if client:supports_method("textDocument/implementation") then
		utils.map("n", "<localleader>gi", "<cmd>Lspsaga finder imp+def<cr>", ls_opts, "goto type implementation")
	end

	if client:supports_method("textDocument/references") then
		utils.map("n", "<localleader>gr", "<cmd>Lspsaga finder ref<cr>", ls_opts, "goto type references")
	end

	if client:supports_method("textDocument/documentSymbol") then
		utils.map("n", "<localleader>ds", Snacks.picker.lsp_symbols, ls_opts, "document symbols")
	end

	if client:supports_method("textDocument/codeAction") then
		utils.map({ "n", "v" }, "<localleader>ca", "<cmd>Lspsaga code_action<cr>", ls_opts, "action")
	end

	if not utils.has("conform.nvim") then
		if client:supports_method("textDocument/formatting") then
			utils.map("n", "<localleader>df", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", ls_opts, "format")
		end
		-- TODO: implement this keymap
		if client:supports_method("textDocument/rangeFormatting") then
			utils.map("v", "<localleader>df", function()
				vim.lsp.buf.format({ async = true })
			end, ls_opts, "range format")
		end
	end

	if client:supports_method("textDocument/rename") then
		utils.map("n", "<localleader>r", "<cmd>Lspsaga rename<cr>", ls_opts, "rename symbol")
	end

	if client:supports_method("textDocument/prepareCallHierarchy") then
		utils.map("n", "<localleader>ci", "<cmd>Lspsaga incoming_calls<cr>", ls_opts, "incoming calls")
		utils.map("n", "<localleader>co", "<cmd>Lspsaga outgoing_calls<cr>", ls_opts, "outgoing calls")
	end

	if client:supports_method("workspace/symbol") then
		utils.map("n", "<localleader>ws", Snacks.picker.lsp_workspace_symbols, ls_opts, "list workspace symbols")
	end

	if client:supports_method("textDocument/publishDiagnostic") then
		-- keymaps
		utils.map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", ls_opts, "goto previous diagnostics")
		utils.map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", ls_opts, "goto next diagnostics")

		--can use ++normal to show in loclist
		utils.map("n", "<localleader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", ls_opts, "line diagnostics")
		utils.map("n", "<localleader>bd", "<cmd>Lspsaga show_buf_diagnostics<cr>", ls_opts, "buffer diagnostics")
		-- stylua: ignore
		utils.map("n", "<localleader>wd", "<cmd>Lspsaga show_workspace_diagnostics<cr>", ls_opts, "workspace diagnostics")

		Snacks.toggle.diagnostics():map("<localleader>ud")
	end

	if client:supports_method("textDocument/documentHighlight") then
		Snacks.toggle.words():map("<localleader>uw")
	end

	if client:supports_method("textDocument/inlayHints") then
		Snacks.toggle.inlay_hints():map("<localleader>uh")
	end

	utils.map("n", "<localleader>wo", "<cmd>Lspsaga outline<cr>", ls_opts, "workspace outline")

	utils.map("n", "<localleader>wf", function()
		vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
	end, ls_opts, "list workspace folders")
end)
