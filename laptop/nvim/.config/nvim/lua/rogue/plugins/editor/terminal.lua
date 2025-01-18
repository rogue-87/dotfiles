---@param program Terminal
---@param cmd string
local function termexec(program, cmd)
	local check = os.execute("command -v " .. cmd .. " >/dev/null 2>&1")

	if check then
		program:toggle()
	else
		vim.notify(cmd .. " is not found. make sure it's installed and available in $PATH", vim.log.levels.WARN, {})
	end
end

return {
	"akinsho/toggleterm.nvim",
	event = { "VeryLazy" },
	config = function()
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal

		toggleterm.setup({
			open_mapping = [[<c-`>]],
			start_in_insert = true,
			shade_filetypes = { "neo-tree" },
			direction = "float",
			float_opts = { border = "single" },
		})

		-- TERMINAL PROGRAMS
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "single",
				width = 180,
				height = 38,
			},
		})

		local btop = Terminal:new({
			cmd = "btop",
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "single",
				width = 180,
				height = 38,
			},
		})

		local cmd = vim.api.nvim_create_user_command
		local map = vim.keymap.set
		-- COMMANDS
		-- stylua: ignore
		cmd("LazyGit", function() termexec(lazygit, lazygit.cmd) end, { desc = "lazygit" })

		-- stylua: ignore
		cmd("Btop", function() termexec(btop, btop.cmd) end, { desc = "btop" })

		-- KEYMAPS FOR TERMINAL PROGRAMS
		local opts = { noremap = true, silent = true }
		opts.desc = "Run Terminal Programs"
		map("n", "<leader>r", "", opts)

		opts.desc = "Lazygit"
		-- stylua: ignore
		map("n", "<leader>rl", function() termexec(lazygit, lazygit.cmd) end, opts)

		opts.desc = "Btop"
		-- stylua: ignore
		map("n", "<leader>rb", function() termexec(btop, btop.cmd) end, opts)
	end,
}
