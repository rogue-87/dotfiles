-- auto-commands go here
local lsp = require("myutils.lsp")

lsp.on_attach(function(client, bufnr)
	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(false)
	end

	if client:supports_method("textDocument/codeLens") then
		vim.lsp.codelens.refresh()
		vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
			buffer = bufnr,
			callback = vim.lsp.codelens.refresh,
		})
	end

	-- prefer LSP folding if client supports it
	if client.server_capabilities.foldingRangeProvider then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
	end
end)
