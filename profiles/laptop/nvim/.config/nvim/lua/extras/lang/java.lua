return {
	"mfussenegger/nvim-jdtls",
	dependencies = {
		-- { "neovim/nvim-lspconfig", optional = true },
		-- { "mfussenegger/nvim-dap", optional = true },
		{ "microsoft/java-debug", version = "^0.53.1", build = "./mvnw clean install" },
		{ "microsoft/vscode-java-test", version = "^0.43.0", build = "npm i && npm run build-plugin" },
	},
}
