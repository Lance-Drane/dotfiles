-- "g/" for an easier find/replace tool using ripgrep
return {
	"chrisgrieser/nvim-rip-substitute",
	keys = {
		{
			"g/",
			function()
				require("rip-substitute").sub()
			end,
			mode = { "n", "x" },
			desc = "Rip Substitute",
		},
	},
}
