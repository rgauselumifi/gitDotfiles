--OPTIONS
local set = vim.opt
set.wildignore = "**/node_modules/**, **lazy-lock.json, **/dist/**"
set.wildignorecase = true
--still need this with fzf?
set.path:append("src/**, packages/**, apps/**, lua/**, after/**, app/**, pages/**, public/**, styles/**")
set.wildmenu = true
set.laststatus = 2
set.ruler = true
vim.cmd("set wc=<c-n>")
set.backup = false
set.fileencoding = "utf-8"
set.signcolumn = "yes"
set.cursorline = true
set.cmdheight = 2
set.pumheight = 8
set.splitright = true
set.splitbelow = true
set.undofile = true
set.termguicolors = true
set.swapfile = false
set.updatetime = 50
set.mouse = "" --enable selecting text with mouse for copy/paste
set.autoindent = true
set.smartindent = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.wrap = false
set.scrolloff = 1
set.hidden = true
set.grepprg = "rg --vimgrep --no-heading --smart-case"
set.grepformat = "%f:%l:%c:%m"
