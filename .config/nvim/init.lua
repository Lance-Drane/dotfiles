-- configure global value for theme plugin to read
local f = io.open("active_theme.txt", "r")
if f then
	DOTFILES_ACTIVE_THEME = f:read("*l")
	f:close()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
