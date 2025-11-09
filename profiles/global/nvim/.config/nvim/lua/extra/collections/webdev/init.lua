require("extra.collections.webdev.lsp.basic").setup()
require("extra.collections.webdev.lsp.svelte").setup()
require("extra.collections.webdev.lsp.tailwindcss").setup()

local node_project = vim.fn.getcwd() .. "/package.json"
if vim.fn.filereadable(node_project) == 1 then
	require("extra.collections.webdev.lsp.typescript-ls").setup()
	require("extra.collections.webdev.tools.node").setup()

	return
end

local deno_project = vim.fn.getcwd() .. "/deno.json"
if vim.fn.filereadable(deno_project) == 1 then
	require("extra.collections.webdev.lsp.deno").setup()
	require("extra.collections.webdev.tools.deno").setup()

	return
end
