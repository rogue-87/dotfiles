return {
	get = function()
		local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if has_cmp then
			return cmp_nvim_lsp.default_capabilities()
		end

		local has_blink, blink_cmp = pcall(require, "blink.cmp")
		if has_blink then
			return blink_cmp.get_lsp_capabilities()
		end

		return vim.lsp.protocol.make_client_capabilities()
	end,
}
