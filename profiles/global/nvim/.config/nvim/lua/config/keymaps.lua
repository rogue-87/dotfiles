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

opts.desc = "quit/session"
utils.map("n", "<leader>q", "", opts)

opts.desc = "quit & save"
utils.map("n", "<leader>qq", "<cmd>wqa<cr>", opts)

opts.desc = "quit witout saving"
utils.map("n", "<leader>qQ", "<cmd>qa!<cr>", opts)

opts.desc = "restart editor"
utils.map("n", "<leader>qr", "<cmd>restart<cr>", opts)

utils.map("n", "<A-n>", "<cmd>tabnew<cr>", opts)
utils.map("n", "<A-c>", "<cmd>tabclose<cr>", opts)
utils.map("n", "<A-.>", "<cmd>tabn<cr>", opts)
utils.map("n", "<A-,>", "<cmd>tabp<cr>", opts)
utils.map("n", "<C-,>", "<cmd>-tabmove<cr>", opts)
utils.map("n", "<C-.>", "<cmd>+tabmove<cr>", opts)

-- NOTE: LSP related mappings
utils.lsp.on_attach(function(client, bufnr)
	local ls_opts = { buffer = bufnr }

	if utils.has("which-key.nvim") then
		local whichkey = require("which-key")

		local spec = {
			{ "<localleader>", desc = "lsp", buffer = bufnr },
			{ "<localleader>c", desc = "code", icon = { icon = "", color = "orange" }, buffer = bufnr },
			{ "<localleader>b", desc = "buffer", buffer = bufnr },
			{ "<localleader>d", desc = "document", icon = { icon = "󰈙", color = "green" }, buffer = bufnr },
			{ "<localleader>g", desc = "goto", icon = { icon = "", color = "orange" }, buffer = bufnr },
			{ "<localleader>l", desc = "line", icon = "", buffer = bufnr },
			{ "<localleader>p", desc = "peek", icon = { icon = "", color = "green" }, buffer = bufnr },
			{ "<localleader>r", desc = "rename", icon = { icon = "", color = "orange" }, buffer = bufnr },
			{ "<localleader>u", desc = "toggles", buffer = bufnr },
			{ "<localleader>w", desc = "workspace", icon = "󱇙", buffer = bufnr },
		}
		---@diagnostic disable-next-line: param-type-mismatch
		whichkey.add(spec)
	end

	if client == nil then
		vim.notify("Couldn't setup language server related keymaps", vim.log.levels.ERROR)
		return
	end

	if client:supports_method("textDocument/hover") then
		utils.map("n", "K", vim.lsp.buf.hover, ls_opts, "hover info")
	end

	if client:supports_method("textDocument/signatureHelp") then
		utils.map("n", "<C-S-K>", vim.lsp.buf.signature_help, ls_opts, "signature help")
	end

	if client:supports_method("textDocument/declaration") then
		utils.map("n", "<localleader>gD", vim.lsp.buf.declaration, ls_opts, "goto declaration")
	end

	if client:supports_method("textDocument/definition") then
		utils.map("n", "<localleader>gd", vim.lsp.buf.definition, ls_opts, "goto definition")
	end

	if client:supports_method("textDocument/typeDefinition") then
		utils.map("n", "<localleader>gt", vim.lsp.buf.type_definition, ls_opts, "goto type definition")
	end

	if client:supports_method("textDocument/implementation") then
		utils.map("n", "<localleader>gi", Snacks.picker.lsp_implementations, ls_opts, "goto type implementation")
	end

	if client:supports_method("textDocument/references") then
		utils.map("n", "<localleader>gr", Snacks.picker.lsp_references, ls_opts, "goto type references")
	end

	if client:supports_method("textDocument/documentSymbol") then
		utils.map("n", "<localleader>ds", Snacks.picker.lsp_symbols, ls_opts, "symbols")
	end

	if client:supports_method("textDocument/codeAction") then
		utils.map({ "n", "v" }, "<localleader>ca", vim.lsp.buf.code_action, ls_opts, "action")
	end

	if client:supports_method("textDocument/formatting") then
		utils.map("n", "<localleader>df", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", ls_opts, "format")
	end

	if client:supports_method("textDocument/rangeFormatting") then
		utils.map("v", "<localleader>df", function()
			vim.lsp.buf.format({
				async = true,
				range = {
					["start"] = vim.api.nvim_buf_get_mark(0, "<"),
					["end"] = vim.api.nvim_buf_get_mark(0, ">"),
				},
			})
		end, ls_opts, "range format")
	end

	if client:supports_method("textDocument/rename") then
		utils.map("n", "<localleader>r", vim.lsp.buf.rename, ls_opts, "rename symbol")
	end

	if client:supports_method("textDocument/prepareCallHierarchy") then
		utils.map("n", "<localleader>ci", Snacks.picker.lsp_incoming_calls, ls_opts, "incoming calls")
		utils.map("n", "<localleader>co", Snacks.picker.lsp_outgoing_calls, ls_opts, "outgoing calls")
	end

	if client:supports_method("workspace/symbol") then
		utils.map("n", "<localleader>ws", Snacks.picker.lsp_workspace_symbols, ls_opts, "list workspace symbols")
	end

	if client:supports_method("textDocument/diagnostic") then
		-- keymaps
		utils.map("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, ls_opts, "goto previous diagnostics")

		utils.map("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, ls_opts, "goto next diagnostics")

		--can use ++normal to show in loclist
		utils.map("n", "<localleader>ld", vim.diagnostic.open_float, ls_opts, "line diagnostics")
		utils.map("n", "<localleader>bd", Snacks.picker.diagnostics_buffer, ls_opts, "buffer diagnostics")

		Snacks.toggle.diagnostics():map("<localleader>ud")
	end

	if client:supports_method("workspace/diagnostic") then
		utils.map("n", "<localleader>wd", Snacks.picker.diagnostics, ls_opts, "workspace diagnostics")
	end

	if client:supports_method("textDocument/inlayHint") then
		Snacks.toggle.inlay_hints():map("<localleader>uh")
	end

	utils.map("n", "<localleader>wf", function()
		vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
	end, ls_opts, "list workspace folders")

	Snacks.toggle.words():map("<localleader>uw")
end)
