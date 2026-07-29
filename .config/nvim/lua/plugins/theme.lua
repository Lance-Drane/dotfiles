-- TODO - find way to dynamically change theme
-- 1) would prefer to symlink a file, but doesn't appear to be possible with Lua imports
-- 2) environment variable? Not easy to change session envs, don't want to rely on .zshrc because might run this from other processes
-- 3) read file with theme name, get theme name, do control flow from that. Can change file pointer with symlink. This is probably best solution
if true then
	return {
		{
			"tokyonight.nvim",
			opts = {
				style = "night",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			},
		},
		{
			"LazyVim/LazyVim",
			opts = { colorscheme = "tokyonight" },
		},
	}
end

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
