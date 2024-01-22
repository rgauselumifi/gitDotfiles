vim.loader.enable()

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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "folke/neodev.nvim", opts = {} },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"stevearc/conform.nvim",
		opts = {

			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 100,
				lsp_fallback = true,
			},
		},
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
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	"github/copilot.vim",
    {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
  },
})

--MAPS
local keymap = vim.keymap.set
keymap("n", "Q", "<nop>")
keymap("i", "jk", "<esc>")
keymap("i", "kj", "<esc>")
keymap("n", "<leader>p", ":Ex<cr>")
keymap("n", "<leader>f", ":find ")
keymap("n", "<leader>g", ":grep ")
keymap("n", "<leader>b", ":b ")
keymap("n", "<leader>/", ":g//#<Left><Left>")
keymap("n", "<leader>N", ":vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile<cr>")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("n", "<leader>c", ":cwindow<cr>")
keymap("n", "<leader>l", ":lw<cr>")
keymap("n", "<c-k>", ":cp<cr>")
keymap("n", "<c-j>", ":cn<cr>")
keymap("n", "<c-p>", ":lp<cr>")
keymap("n", "<c-n>", ":ln<cr>")
keymap("n", "]b", ":bnext<cr>")
keymap("n", "[b", ":bprevious<cr>")
keymap("n", "]a", ":next<cr>")
keymap("n", "[a", ":previous<cr>")
keymap("n", "'", "`")

keymap("i", "{<cr>", "{<cr>}<esc>O")
keymap("i", "[<cr>", "[<cr>]<esc>O")
keymap("i", "(<cr>", "(<cr>)<esc>O")
keymap("i", "{,", "{<cr>},<esc>O")
keymap("i", "[,", "[<cr>],<esc>O")
keymap("i", "(,", "(<cr>),<esc>O")

--OPTIONS
local set = vim.opt
set.wildignore = "**/node_modules/**, **lazy-lock.json"
set.wildignorecase = true
set.clipboard:append("unnamedplus")
set.path:append("src/**, packages/**, apps/**")
set.wildmenu = true
set.backup = false
set.fileencoding = "utf-8"
set.cursorline = true
set.undofile = true
set.termguicolors = true
set.swapfile = false
set.updatetime = 50
set.guicursor = ""
set.mouse = "" --enable selecting text with mouse for copy/paste
set.autoindent = true
set.smartindent = true
set.laststatus = 0
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.wrap = false
set.scrolloff = 8
set.hidden = true
set.grepprg = "rg --vimgrep --no-heading --smart-case"
set.grepformat = "%f:%l:%c:%m"

--LSP

-- vim.cmd([[colorscheme solarized]])
