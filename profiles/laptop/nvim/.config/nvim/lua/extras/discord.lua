require("which-key").add({
	{ "<leader>c", desc = "Cord", icon = { icon = "󰙯", color = "blue" } },
})

return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	lazy = false,
	---@module "cord"
	---@type CordConfig
	opts = {},
	keys = {
		{ "<leader>ce", "<cmd>Cord enable<cr>", desc = "Enable" },
		{ "<leader>cd", "<cmd>Cord disable<cr>", desc = "Disable" },
		{ "<leader>ch", "<cmd>Cord health<cr>", desc = "Health" },
		{ "<leader>cu", "<cmd>Cord update<cr>", desc = "Update" },
		{ "<leader>cv", "<cmd>Cord version<cr>", desc = "Version" },
		{ "<leader>ct", "<cmd>Cord toggle<cr>", desc = "Toggle" },
		{ "<leader>cr", "<cmd>Cord restart<cr>", desc = "Restart" },
		{ "<leader>cs", "<cmd>Cord status<cr>", desc = "Status" },
		{ "<leader>ci", "<cmd>Cord idle<cr>", desc = "Idle" },
		{ "<leader>cp", "<cmd>Cord presence<cr>", desc = "Presence" },
	},
}
