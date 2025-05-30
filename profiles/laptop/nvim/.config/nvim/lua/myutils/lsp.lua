local M = {}

--- ```lua
--- shortcut to
--- vim.api.nvim_create_autocmd("LspAttatch", function(client, bufnr)
--- 	callback = function(args)
--- 		local bufnr = args.buf
--- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
--- 		on_attach(client, bufnr)
--- 	end
--- end)
--- ```
---@param on_attach fun(client: vim.lsp.Client?, bufnr: integer)
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

M.capabilities = {}
-- not needed if nvim version >= 0.11
function M.capabilities.get()
	-- stylua: ignore
	if M.has("blink.cmp") then return require("blink-cmp").get_lsp_capabilities() end

	return vim.lsp.protocol.make_client_capabilities()
end

return M
