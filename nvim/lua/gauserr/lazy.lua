--PLUGINS
---@diagnostic disable: missing-fields
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correctlllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
vim.g.maplocalleader = " "

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
	},
	-- {
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- 	after = "nvim-treesitter",
	-- },
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "folke/neodev.nvim", opts = {} },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	"github/copilot.vim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"ojroques/vim-oscyank",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = {
				rainbow = {
					enabled = true,
					shade = 5,
				},
			},
			highlight = {
				backdrop = true,
			},
			modes = {
				search = {
					enabled = true,
				},
				char = {
					enabled = false,
				},
			},
		},
		keys = {
			{
				"R",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"r",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
		},
	},
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		opts = {
			width = 100,
			autocmds = {
				enableOnVimEnter = true,
				enableOnTabEnter = true,
				skipEnteringNoNeckPainBuffer = true,
			},
			buffers = {
				right = {
					enabled = false,
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		branch = "dev", -- IMPORTANT!
		config = function()
			require("trouble").setup({})
		end,
		keys = {
			{ "<leader>c", "<cmd>Trouble toggle<cr>" },
			{
				"<leader>d",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>D",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tr",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>l",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>q",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<c-p>",
				"<cmd>Trouble prev<cr>",
			},
			{
				"<c-n>",
				"<cmd>Trouble next<cr>",
			},
			{
				"[d",
				"<cmd>Trouble first<cr>",
			},
			{
				"]d",
				"<cmd>Trouble last<cr>",
			},
		},
	},

	-- themes
	"sainnhe/everforest",
	"iruzo/matrix-nvim",
	"danishprakash/vim-yami",
	"bcicen/vim-vice",
	"Mofiqul/vscode.nvim",
	"water-sucks/darkrose.nvim",
	"shaunsingh/moonlight.nvim",
})
vim.cmd("colorscheme everforest")
