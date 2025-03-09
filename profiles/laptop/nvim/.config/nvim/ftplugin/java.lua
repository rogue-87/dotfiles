local utils = require("config.utils")

local config = {
	cmd = { vim.fn.exepath("jdtls") },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
local plugins_path = vim.fn.stdpath("data") .. "/lazy"
local bundles = {}

if utils.has("java-debug") then
	table.insert(
		bundles,
		vim.fn.glob(
			plugins_path .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
			true
		)
	)
end

if utils.has("vscode-java-test") then
	vim.list_extend(bundles, vim.split(vim.fn.glob(plugins_path .. "/vscode-java-test/server/*.jar", true), "\n"))
end

config["init_options"] = { bundles = bundles }

if utils.has("nvim-jdtls") then
	require("jdtls").start_or_attach(config)
	vim.print(bundles)
end
