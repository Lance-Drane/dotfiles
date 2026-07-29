-- configure global value for theme plugin to read
local config_path = vim.fn.stdpath("config") .. "/active_theme.txt"
local f = io.open(config_path, "r")
if f then
	DOTFILES_ACTIVE_THEME = f:read("*l")
	f:close()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
