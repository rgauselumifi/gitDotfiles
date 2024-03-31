require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "html", "json", "prisma" },
	modules = {},
	auto_install = true,
	ignore_install = {},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	textobjects = {
		move = {
			enable = false,
		},
		select = {
			enable = false,
		},
		swap = {
			enable = true,
			swap_next = {
				[",x"] = "@parameter.inner",
			},
			swap_previous = {
				[",X"] = "@parameter.inner",
			},
		},
	},
})

require("treesitter-context").setup({
	enable = false,
	max_lines = 8,
})

vim.keymap.set("n", ",c", ":TSContextToggle<CR>")
