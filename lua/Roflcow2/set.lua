require("Roflcow2.functions")
--Fat Cursor
vim.opt.guicursor = ""

--Italic Comments
vim.cmd('highlight Comment cterm=italic')

--Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.exrc = true

--Tab Settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

--Search Settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

--turn off word wrap
vim.opt.wrap = false

--No backups except for undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. '/.nvim/undodir'
vim.opt.undofile = true

--fix colors
vim.opt.termguicolors = true

vim.opt.signcolumn = 'auto'
vim.opt.scrolloff = 10

--shows current buffer number, filename, and file type
--Sets status line always on
vim.opt.laststatus=2
--highlight status bar... would like to figure out how to highlight specific elements
vim.opt.statusline:append("%#PmenuSel#")
--Shows git branch
vim.opt.statusline:append("Buffer: %n | %t%y")
vim.opt.statusline:append(statuslineGit())
