local Colors = require("scripts.setup.lib.colors")

---@param callback fun():boolean?
---@param opts { question: string, success_msg: string, fail_msg: string, before?: string, after?: string}
local function prompt(callback, opts)
	if opts.before == nil then
		opts.before = ""
	end

	if opts.after == nil then
		opts.after = ""
	end

	-- stylua: ignore
	print(
		opts.before
			.. Colors.white
			.. opts.question
			.. " "
			.. Colors.reset
			.. "("
			.. Colors.green
			.. "yes"
			.. Colors.reset
			.. "/"
			.. Colors.red
			.. "No"
			.. Colors.reset
			.. ")\n" ..
		opts.after
	)
	---@type "yes" | "y" | "no" |"n"
	local answer = io.read("*l")
	if answer == "yes" or answer == "y" then
		local result = callback()

		if result == true then
			print(Colors.green .. opts.success_msg .. Colors.reset)
		else
			print(Colors.red .. opts.fail_msg .. Colors.reset)
		end
	end
end

return prompt
