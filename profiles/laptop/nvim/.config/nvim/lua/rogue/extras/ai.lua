return {
	{
		"supermaven-inc/supermaven-nvim",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		optional = true,
		opts = {
			sources = {
				providers = { dadbod = { name = "SuperMaven", module = "vim_dadbod_completion.blink" } },
			},
		},
	},
}
