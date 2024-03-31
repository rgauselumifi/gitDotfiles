require("lualine").setup({
	options = {
		refresh = {
			satusline = 200,
		},
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {},
		lualine_y = {},
	},
})
