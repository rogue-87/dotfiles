local M = {}

function M.setup()
	if utils.has("guard.nvim") then
		local ft = require("guard.filetype")

		local gdformat = {
			cmd = "gdformat",
			args = { "-" },
			stdin = true,
		}

		ft("gdscript"):fmt(gdformat):append("lsp")
	end
end

return M
