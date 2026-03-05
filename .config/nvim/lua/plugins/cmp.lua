-- supertab functionality, and also disable enter from accepting autosuggestions

return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = false, --allows pressing "Enter" immediately without selecting an option
					auto_insert = true,
				},
			},
		},
	},
}
