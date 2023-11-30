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
	{ "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 7 } },
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
				timeout_ms = 500,
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
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },

	"lewis6991/gitsigns.nvim",
	"github/copilot.vim",
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({ "max-perf", winopts = { fullscreen = true } })
		end,
	},
})

--MAPS
local keymap = vim.keymap.set
keymap("n", "Q", "<nop>")
keymap("n", "<leader>p", ":Ex<cr>")
keymap("n", "<leader>f", ":find *")
keymap("n", "<leader>g", ":vim '' **/*<Left><Left><Left><Left><Left><Left>")
keymap("n", "<leader>n", ":noh<cr>")
keymap("n", "<leader>/", ":g//#<Left><Left>")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("n", "<leader>q", ":copen<cr>")
keymap("n", "<leader>Q", ":ccl<cr>")
keymap("n", "<leader>d", ":lua vim.diagnostic.setqflist()<cr>")
keymap("n", "[q", ":cp<cr>")
keymap("n", "]q", ":cn<cr>")
keymap("n", "[f", ":colder<cr>")
keymap("n", "]f", ":cnewer<cr>")
keymap("n", "]b", ":bnext<cr>")
keymap("n", "[b", ":bprevious<cr>")
keymap("n", "[t", ":tp<cr>")
keymap("n", "]t", ":tn<cr>")
keymap("n", "[T", ":tf<cr>")
keymap("n", "]T", ":tl<cr>")

--OPTIONS
local set = vim.opt
set.path:append("**")
set.wildignore = "**/node_modules/**, **lazy-lock.json"
set.clipboard:append("unnamedplus")
set.wildmenu = true
set.backup = false
set.fileencoding = "utf-8"
set.cursorline = true
set.undofile = true
set.swapfile = false
set.updatetime = 50
set.modifiable = true
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

--GIT
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

--LSP
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "go", function()
		vim.lsp.buf.type_definition()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "gs", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "gR", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "ga", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>li", ":LspInfo<cr>")
	vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>")
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"emmet_language_server",
		"tsserver",
		"tailwindcss",
		"prismals",
		"lua_ls",
		"html",
		"graphql",
		"cssls",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
		end,
	},
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
})

vim.cmd([[colorscheme torte]])
