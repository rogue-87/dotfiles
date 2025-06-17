---@type vim.lsp.Config
return {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = {
		".git",
		"build.gradle",
		"build.gradle.kts",
		"build.xml",
		"pom.xml",
		"settings.gradle",
		"settings.gradle.kts",
	},
}
