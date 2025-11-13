local M = {}

function M.setup()
	if utils.has("nvim-dap") then
		local dap = require("dap")
		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6006,
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
			},
		}
	end
end

return M
