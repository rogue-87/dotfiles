---@param command_name string
---@param client vim.lsp.Client
---@param bufnr integer
---@return fun():nil run_tinymist_command, string cmd_name, string cmd_desc
local function create_tinymist_command(command_name, client, bufnr)
	local export_type = command_name:match("tinymist%.export(%w+)")
	local info_type = command_name:match("tinymist%.(%w+)")
	if info_type and info_type:match("^get") then
		info_type = info_type:gsub("^get", "Get")
	end
	local cmd_display = export_type or info_type
	---@return nil
	local function run_tinymist_command()
		local arguments = { vim.api.nvim_buf_get_name(bufnr) }
		local title_str = export_type and ("Export " .. cmd_display) or cmd_display
		---@type lsp.Handler
		local function handler(err, res)
			if err then
				return vim.notify(err.code .. ": " .. err.message, vim.log.levels.ERROR)
			end
			-- If exporting, show the string result; else, show the table for inspection
			vim.notify(export_type and res or vim.inspect(res), vim.log.levels.INFO)
		end
		return client:exec_cmd({
			title = title_str,
			command = command_name,
			arguments = arguments,
		}, { bufnr = bufnr }, handler)
	end
	-- Construct a readable command name/desc
	local cmd_name = export_type and ("TinymistExport" .. cmd_display) or ("Tinymist" .. cmd_display) ---@type string
	local cmd_desc = export_type and ("Export to " .. cmd_display) or ("Get " .. cmd_display) ---@type string
	return run_tinymist_command, cmd_name, cmd_desc
end

---@type vim.lsp.Config
return {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { ".git" },
	settings = {},
}
