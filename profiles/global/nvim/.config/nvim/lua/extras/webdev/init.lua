---@type LazySpec[]
local Spec = {}

require("extras.webdev.lsp.basic").setup()
require("extras.webdev.lsp.svelte").setup()
require("extras.webdev.lsp.tailwindcss").setup()

if vim.fn.filereadable("package.json") == 1 then
	require("extras.webdev.lsp.typescript-ls").setup()
	table.insert(Spec, require("extras.webdev.tools.node"))
elseif vim.fn.filereadable("deno.json") == 1 then
	require("extras.webdev.lsp.deno").setup()
	table.insert(Spec, require("extras.webdev.tools.deno"))
end

return Spec
