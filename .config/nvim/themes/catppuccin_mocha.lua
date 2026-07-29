return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "catppuccin-nvim" },
	},
}
