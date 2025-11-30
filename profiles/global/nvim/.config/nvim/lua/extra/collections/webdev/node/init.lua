local Node = {}

Node.eslint = require("extra.collections.webdev.node.eslint")
Node.prettier = require("extra.collections.webdev.node.prettier")
Node.typescript_ls = require("extra.collections.webdev.node.typescript-ls")

function Node.setup()
	Node.eslint:setup()
	Node.prettier:setup()
	Node.typescript_ls:setup()
end

return Node
