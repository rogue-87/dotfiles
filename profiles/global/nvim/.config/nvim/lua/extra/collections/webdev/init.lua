require("extra.collections.webdev.other").setup()

if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") == 1 then
	require("extra.collections.webdev.node").setup()
	return
end

if vim.fn.filereadable(vim.fn.getcwd() .. "/deno.json") == 1 then
	require("extra.collections.webdev.deno").setup()
	return
end
