local Colors = require("scripts.setup.lib.colors")

local brew = {}

-- installs [homebrew](https://brew.sh)
function brew.setup()
	print(Colors.yellow .. "Do you want to install brew package manager? (yes/no)" .. Colors.reset)
	---@type "yes" | "y" | "no" |"n"
	local answer = io.read("*l")
	if answer == "yes" or "y" then
		local result = os.execute(
			'/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
		)

		if result == true then
			print(Colors.green .. "brew has been installed successfully!" .. Colors.reset)
			return
		end
		print(Colors.red .. "failed to install brew..." .. Colors.reset)
	end
end

return brew
