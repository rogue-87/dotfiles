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
	version = "*",
	event = { "VeryLazy" },
	---@module "toggleterm"
	---@type ToggleTermConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		open_mapping = [[<c-`>]],
		start_in_insert = true,
		shade_filetypes = { "neo-tree" },
		direction = "horizontal",
		float_opts = { border = "single" },
	},
	config = function(_, opts)
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal

		toggleterm.setup(opts)

		-- TERMINAL PROGRAMS
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "single",
				width = 150,
				height = 30,
			},
		})

		local btop = Terminal:new({
			cmd = "btop",
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "single",
				width = 150,
				height = 30,
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
