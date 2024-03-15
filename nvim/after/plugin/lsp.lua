require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"tailwindcss",
		"vimls",
	},
})

-- setup lsp servers
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities,
})
lspconfig.tsserver.setup({
	capabilities = lsp_capabilities,
})
lspconfig.cssls.setup({
	capabilities = lsp_capabilities,
})
lspconfig.eslint.setup({
	capabilities = lsp_capabilities,
})
lspconfig.html.setup({
	capabilities = lsp_capabilities,
})
lspconfig.jsonls.setup({
	capabilities = lsp_capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = lsp_capabilities,
})
lspconfig.vimls.setup({
	capabilities = lsp_capabilities,
})

-- when lsp attaches, set keypmaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", ",i", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", ",k", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", ",wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", ",wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", ",wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", ",t", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", ",n", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, ",a", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", ",r", vim.lsp.buf.references, opts)
		vim.keymap.set("n", ",f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		-- vim.keymap.set("n", "<c-n>", vim.diagnostic.goto_next, opts)
		-- vim.keymap.set("n", "<c-p>", vim.diagnostic.goto_prev, opts)
	end,
})

-- add snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- setup completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<c-y>"] = cmp.mapping.confirm({
			select = true,
		}),
		["<C-f>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "[lsp]",
				luasnip = "[luasnip]",
				buffer = "[buf]",
				path = "[path]",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
		expandable_indicator = true,
	},
})

-- use lsp tagfunc for tags
vim.cmd([[ set tagfunc=v:lua.vim.lsp.tagfunc ]])

-- diagnostic settings
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = false,
})
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

-- lsp styling
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
