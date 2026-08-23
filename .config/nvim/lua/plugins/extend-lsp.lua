return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.servers.ruff = {
				init_options = {
					settings = {
						lineLength = 100,
					},
				},
			}

			opts.servers.basedpyright = {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
							ignore = { "*" },
						},
						disableOrganizeImports = true,
					},
				},
			}

			-- use rust_analyzer on system, not mason
			-- opts.server.rust_analyzer = {
			-- 	mason = false,
			-- }
		end,
	},
}
