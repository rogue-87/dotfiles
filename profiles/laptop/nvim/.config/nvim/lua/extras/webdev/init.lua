local Spec = {}
vim.g.markdown_fenced_languages = { "ts=typescript" }
require("extras.webdev.lsp.basic").setup()
require("extras.webdev.lsp.svelte").setup()

if vim.fn.filereadable("package.json") == 1 then
	require("extras.webdev.lsp.typescript-ls").setup()
	table.insert(Spec, require("extras.webdev.etc.fmt").node)
	table.insert(Spec, require("extras.webdev.etc.lnt").node)
elseif vim.fn.filereadable("deno.json") == 1 then
	vim.print("foobar")
	require("extras.webdev.lsp.deno").setup()
	table.insert(Spec, require("extras.webdev.etc.fmt").deno)
	table.insert(Spec, require("extras.webdev.etc.lnt").deno)
end

return Spec
