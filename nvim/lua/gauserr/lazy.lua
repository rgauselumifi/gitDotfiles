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

vim.g.mapleader =
" " -- Make sure to set `mapleader` before lazy so your mappings are correctlllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
vim.g.maplocalleader = " "

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({

        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "json",
          "prisma",
        },
        modules = {},
        auto_install = true,
        ignore_install = {},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },
  -- {
  -- 	"HiPhish/rainbow-delimiters.nvim",
  -- 	after = "nvim-treesitter",
  -- 	config = function()
  -- 		local rainbow_delimiters = require("rainbow-delimiters")
  --
  -- 		vim.g.rainbow_delimiters = {
  -- 			strategy = {
  -- 				[""] = rainbow_delimiters.strategy["global"],
  -- 				commonlisp = rainbow_delimiters.strategy["local"],
  -- 			},
  -- 			query = {
  -- 				[""] = "rainbow-delimiters",
  -- 				lua = "rainbow-blocks",
  -- 			},
  -- 			priority = {
  -- 				[""] = 110,
  -- 				lua = 210,
  -- 			},
  -- 			highlight = {
  --          "RainberskiBlue",
  --          "RainberskiGreen",
  --          "RainberskiRed",
  --          "RainberskiCyan",
  --          "RainberskiYellow",
  --          "RainberskiViolet",
  --          "RainberskiMagenta",
  -- 			},
  -- 			blacklist = { "c", "cpp" },
  -- 		}
  -- 	end,
  -- },
  { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  { "folke/neodev.nvim",      opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
    },
    config = function()
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
          "prismals"
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
      lspconfig.prismals.setup({
        capabilities = lsp_capabilities,
      })

      -- when lsp attaches, set keypmaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          local opts = { buffer = ev.buf }
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
          -- vim.keymap.set("n", ",r", vim.lsp.buf.references, opts)
        end,
      })

      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")

      cmp.setup({
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
        },

        sources = {
          { name = "nvim_lsp" },
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
              buffer = "[buf]",
              path = "[path]",
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
          expandable_indicator = true,
        },
      })

      vim.cmd([[ set tagfunc=v:lua.vim.lsp.tagfunc ]])

      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        signs = false,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { { "stylua" } },
        css = { { "prettierd" } },
        javascript = { { "eslint_d", "prettierd" } },
        typescript = { { "eslint_d", "prettierd" } },
        javascriptreact = { { "eslint_d", "prettierd" } },
        typescriptreact = { { "eslint_d", "prettierd" } },
      },
      format_on_save = {
        timeout_ms = 100000,
        lsp_fallback = true,
      },
    },
    keys = {
      {
        ",f",
        mode = "n",
        function()
          require("conform").format()
        end,
        desc = "Format buffer",
      },
      {
        ",F",
        mode = "n",
        function()
          vim.lsp.buf.format()
        end,
        desc = "Format buffer",
      }
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
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 100,
        max_height = 20,
      },
    },
    keys = {
      {
        "<leader>s",
        function()
          require("oil").open()
        end,
        desc = "Open Oil",
      },
    },
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
    config = function()
      require("lualine").setup({
        options = {
          refresh = {
            satusline = 200,
          },
          -- theme = "tokyonight",
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
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>G",
        ":Git ",
      },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>hd', gitsigns.diffthis)
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        map('n', '<leader>td', gitsigns.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    }
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {

      "default",
      winopts = {
        fullscreen = false,
        preview = {
          layout = "horizontal",
          horizontal = "right:60%",
          winopts = {},
        },
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "toggle-all",
        },
      },
      files = {
        previewer = false,
      },
      buffers = {
        previewer = false,
      },
    },
    keys = {
      -- {
      -- 	"<leader>f",
      -- 	function()
      -- 		require("fzf-lua").files()
      -- 	end,
      -- 	desc = "FZF Files",
      -- },
      -- {
      -- 	"<leader>g",
      -- 	function()
      -- 		require("fzf-lua").live_grep()
      -- 	end,
      -- 	desc = "FZF Live Grep",
      -- },
      -- {
      -- 	"<leader>b",
      -- 	function()
      -- 		require("fzf-lua").buffers()
      -- 	end,
      -- 	desc = "FZF Buffers",
      -- },
      -- {
      -- 	"<leader>Fc",
      -- 	function()
      -- 		require("fzf-lua").colorschemes()
      -- 	end,
      -- 	desc = "FZF Colorschemes",
      -- },
    },
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      padding = false,
    },
    keys = {
      {
        "<leader>c",
        function()
          require("trouble").close()
        end,
        desc = "Trouble Toggle",
      },
      {
        "<leader>d",
        function()
          require("trouble").toggle("document_diagnostics")
        end,
        desc = "Trouble LSP Diagnostics",
      },
      {
        "<leader>q",
        function()
          require("trouble").toggle("quickfix")
        end,
        desc = "Trouble Quickfix",
      },
      {
        "<c-n>",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Trouble Quickfix",
      },
      {
        "<c-p>",
        function()
          require("trouble").previous({ skip_groups = true, jump = true })
        end,
        desc = "Trouble Quickfix",
      },
      {
        "[d",
        function()
          require("trouble").first({ skip_groups = true, jump = true })
        end,
        desc = "Trouble Quickfix",
      },
      {
        "]d",
        function()
          require("trouble").last({ skip_groups = true, jump = true })
        end,
        desc = "Trouble Quickfix",
      },
      {
        ",r",
        function()
          require("trouble").open("lsp_references")
        end,
      },
    },
  },
  {
    "eandrju/cellular-automaton.nvim",
    config = function()
      local slide = {
        fps = 50,
        name = "slide",
      }
      slide.update = function(grid)
        for i = 1, #grid do
          local prev = grid[i][#grid[i]]
          for j = 1, #grid[i] do
            grid[i][j], prev = prev, grid[i][j]
          end
        end
        return true
      end

      require("cellular-automaton").register_animation(slide)
    end,
    keys = {
      {
        ",Cr",
        "<cmd>CellularAutomaton make_it_rain<cr>",
      },
      {
        ",Cs",
        "<cmd>CellularAutomaton scramble<cr>",
      },
      {
        ",Cl",
        "<cmd>CellularAutomaton slide<cr>",
      },
    },
  },
  {
    "tummetott/reticle.nvim",
    event = "VeryLazy", -- optionally lazy load the plugin
    opts = {
      -- add options here if you wish to override the default settings
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local trouble = require("trouble.providers.telescope")
      require("telescope").setup({
        defaults = {
          layout_config = {
            -- height = 0.5,
            -- width = 0.5,
          },
          file_ignore_patterns = { "material3.css" },
          -- preview = {
          -- 	hide_on_startup = true,
          -- },
          mappings = {
            i = { ["<c-q>"] = trouble.open_with_trouble },
            n = { ["<c-q>"] = trouble.open_with_trouble },
          },
        },
        pickers = {
          find_files = {
            preview = {
              hide_on_startup = true,
            },
          },
          live_grep = {
            layout_config = {
              width = 0.9,
              horizontal = {
                preview_width = 0.6,
              },
            },
          },
          buffers = {
            preview = {
              hide_on_startup = true,
            },
          },
          colorscheme = {},
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
    keys = {
      {
        "<leader>f",
        mode = { "n", "v" },
        "<cmd>Telescope find_files<cr>",
      },
      {
        "<leader>g",
        mode = { "n", "v" },
        "<cmd>Telescope live_grep<cr>",
      },
      {
        "<leader>b",
        mode = { "n", "v" },
        "<cmd>Telescope buffers<cr>",
      },
      {
        "<leader>Fc",
        mode = { "n", "v" },
        "<cmd>Telescope colorscheme<cr>",
      },
      {
        "<leader>;",
        mode = { "n", "v" },
        "<cmd>Telescope resume<cr>",
      },
    },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      messages = { enabled = false },
      notify = { enabled = false },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "background",
      virtual_symbol = "■",
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },
  "github/copilot.vim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
    },
    keys = { {
      "<leader>Cs",
      "<cmd>CopilotChatCommitStaged<cr>",
    } },
  },
  "rgauselumifi/alabaster.nvim",
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.o.background = 'dark' -- or 'light'
      --
      -- vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    }
  },
  "luisiacc/the-matrix.nvim"
})

vim.cmd([[colorscheme alabaster]])
