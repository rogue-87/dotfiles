--- WARN: this language server is still in pre-alpha

---@type vim.lsp.Config
return {
	cmd = { "kotlin-ls", "--stdio" },
	single_file_support = true,
	filetypes = { "kotlin" },
	root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
}
