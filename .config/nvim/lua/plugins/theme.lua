-- if we didn't set the global variable (i.o. error with opening the file), then fail fast
if not DOTFILES_ACTIVE_THEME then
	return {}
end

-- THEMES - each theme should take a subtheme argument --

local function tokyonight(subtheme)
	return {
		{
			"tokyonight.nvim",
			opts = {
				style = subtheme,
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

local function catppuccin(subtheme)
	return {
		{
			"catppuccin/nvim",
			name = "catppuccin",
			opts = {
				flavour = subtheme,
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
end

-- THEME CONFIGURATION --

local THEMES = {
	tokyonight = tokyonight,
	catppuccin = catppuccin,
}

-- [1] = primary theme, [2] = subtheme
local theme_tokens = vim.split(DOTFILES_ACTIVE_THEME, "_")
local theme_function = THEMES[theme_tokens[1]]
if not theme_function then
	return {}
end
return theme_function(theme_tokens[2]) or {}
