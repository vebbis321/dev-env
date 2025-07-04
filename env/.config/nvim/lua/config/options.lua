local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- line wrapping
opt.wrap = true

-- search opttings
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- backing
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- backspace
opt.backspace = "indent,eol,start"

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.textwidth = 98
opt.cursorline = true
opt.background = "dark"

opt.scrolloff = 999
opt.isfname:append("@-@")
opt.updatetime = 50

-- paste
opt.clipboard = "unnamedplus"
-- sync
opt.autoread = true
