-- th.git = th.git or {}
-- th.git.modified = ui.Style():fg("yellow")
-- th.git.modified_sign = "M"
--th.git.deleted = ui.Style():fg("red")
--th.git.deleted_sign = "D"
require("session"):setup({
	sync_yanked = true,
})
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
})
require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
require("starship"):setup({
	show_right_prompt = true,
})
