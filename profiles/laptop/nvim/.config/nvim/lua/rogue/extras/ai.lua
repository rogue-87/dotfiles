local spec = {
	-- fast, large context window, limited range of programming languages.
	["supermaven"] = {
		{ "supermaven-inc/supermaven-nvim", opts = {} },
		{
			"saghen/blink.cmp",
			optional = true,
			opts = {
				sources = {
					default = { "supermaven" },
					providers = {
						supermaven = {
							name = "SuperMaven",
							module = "blink.compat.source",
							opts = {},
						},
					},
				},
			},
		},
	},
	-- moderate speed, small context window, wide range of programming languages.
	["codeium"] = {
		{
			"Exafunction/codeium.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				use_nvim_cmp = false,
				virtual_text = {
					enabled = true,
				},
			},
		},
		{
			"saghen/blink.cmp",
			optional = true,
			opts = {
				sources = {
					default = { "codeium" },
					providers = {
						codeium = {
							name = "codeium",
							module = "blink.compat.source",
							opts = {},
						},
					},
				},
			},
		},
	},
}

-- don't want this plugin?
-- just comment out the import line in lua/rogue/init.lua
-- it's (rogue.extras.ai)
return spec["supermaven"]
