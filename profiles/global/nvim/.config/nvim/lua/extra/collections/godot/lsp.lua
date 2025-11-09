local M = {}

function M.setup()
	local port = os.getenv("GDScript_Port") or "6005"
	local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))

	vim.lsp.config.gdscript = {
		cmd = cmd,
		filetypes = { "gd", "gdscript", "gdscript3" },
		root_markers = { "project.godot", ".git" },
	}

	vim.lsp.config.gdshader_ls = {
		cmd = { "gdshader-lsp", "--stdio" },
		filetypes = { "gdshader", "gdshaderinc" },
		root_markers = { "project.godot" },
	}

	vim.lsp.enable({ "gdscript", "gdshader_ls" })
end

return M
