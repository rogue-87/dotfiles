-- auto-commands go here
local utils = require("utils")

utils.lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	--[[ if client.server_capabilities.completionProvider then
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	end ]]

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(false)
	end

	-- prefer LSP folding if client supports it
	if client.server_capabilities.foldingRangeProvider then
		local win = vim.api.nvim_get_current_win()
		vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
	end
end)

utils.lsp.on_detach()
