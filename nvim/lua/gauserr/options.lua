--OPTIONS
local set = vim.opt
set.wildignore = "**/node_modules/**, **lazy-lock.json"
set.wildignorecase = true
set.clipboard:append("unnamedplus")
set.path:append("src/**, packages/**, apps/**, lua/**, after/**")
set.wildmenu = true
set.laststatus = 1
set.ruler = true
set.backup = false
set.fileencoding = "utf-8"
set.cursorline = true
set.cmdheight = 0
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
