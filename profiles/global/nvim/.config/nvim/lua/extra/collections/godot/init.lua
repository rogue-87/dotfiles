local projectfile = vim.fn.getcwd() .. "/project.godot"
if vim.fn.filereadable(projectfile) == 1 then
	require("extra.collections.godot.lsp").setup()
	require("extra.collections.godot.dap").setup()
	require("extra.collections.godot.tools").setup()
	vim.fn.serverstart("./godothost")
end
