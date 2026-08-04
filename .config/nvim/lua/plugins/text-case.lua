-- "ga" over a word to open up prompt to change work to snake_case/camelCase/etc.
-- on command line mode, use ":Subs/first_class/second_class" (can use "S" to select entire objects)
return {
	"johmsalas/text-case.nvim",
	lazy = false,
	config = true,
	cmd = {
		"Subs",
		"TextCaseStartReplacingCommand",
	},
}
