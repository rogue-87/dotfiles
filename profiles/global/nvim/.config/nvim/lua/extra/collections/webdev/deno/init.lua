local Deno = {}

Deno.fmt = require("extra.collections.webdev.deno.fmt")
Deno.lint = require("extra.collections.webdev.deno.lint")
Deno.lsp = require("extra.collections.webdev.deno.lsp")

function Deno.setup()
	Deno.fmt:setup()
	Deno.lsp:setup()
end

return Deno
