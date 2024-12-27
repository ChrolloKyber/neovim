return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "aws",
					path = "~/AWS SAA",
				},
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		ft = "markdown",
	},
}
