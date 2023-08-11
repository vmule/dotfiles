require("nvim-tree").setup({
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	view = {
		side = "left",
		width = "240",
	},
})
