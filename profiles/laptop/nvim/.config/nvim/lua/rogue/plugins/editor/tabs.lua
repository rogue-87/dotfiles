return {
	"nanozuki/tabby.nvim",
	event = { "VimEnter" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local theme = {
			fill = "TabLineFill",
			head = "TabLine",
			current_tab = "TabLineSel",
			tab = "TabLine",
			win = "TabLine",
			tail = "TabLine",
		}
		require("tabby").setup({
			line = function(line)
				return {
					{
						{ "  ", hl = theme.head },
						line.sep("", theme.head, theme.fill),
					},
					line.tabs().foreach(function(tab)
						local hl = tab.is_current() and theme.current_tab or theme.tab
						return {
							line.sep("", hl, theme.fill),
							-- tab.is_current() and "" or "󰆣",
							tab.number(),
							tab.name(),
							-- tab.close_btn(""),
							line.sep("", hl, theme.fill),
							hl = hl,
							margin = " ",
						}
					end),
					line.spacer(),
				}
			end,
		})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<A-n>", "<cmd>tabnew<cr>", opts)
		vim.keymap.set("n", "<A-c>", "<cmd>tabclose<cr>", opts)
		-- vim.keymap.set("n", "<A-t>", "<cmd>tabonly<cr>", opts)
		vim.keymap.set("n", "<A-.>", "<cmd>tabn<cr>", opts)
		vim.keymap.set("n", "<A-,>", "<cmd>tabp<cr>", opts)
		vim.keymap.set("n", "<C-,>", "<cmd>-tabmove<cr>", opts)
		vim.keymap.set("n", "<C-.>", "<cmd>+tabmove<cr>", opts)
	end,
}
