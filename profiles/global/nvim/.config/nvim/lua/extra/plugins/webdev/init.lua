---@type LazySpec[]
local Spec = {}

require("extra.plugins.webdev.lsp.basic").setup()
require("extra.plugins.webdev.lsp.svelte").setup()
require("extra.plugins.webdev.lsp.tailwindcss").setup()

if vim.fn.filereadable("package.json") == 1 then
	require("extra.plugins.webdev.lsp.typescript-ls").setup()
	table.insert(Spec, require("extra.plugins.webdev.tools.node"))
elseif vim.fn.filereadable("deno.json") == 1 then
	require("extra.plugins.webdev.lsp.deno").setup()
	table.insert(Spec, require("extra.plugins.webdev.tools.deno"))
end

return Spec
