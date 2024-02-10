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


local function gitBranch()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n", "")  -- Remove trailing newline
end
--shows current buffer number, filename, and file type
--Sets status line always on
vim.opt.laststatus=2
--Shows git branch
--vim.opt.statusline:append("
--vim.opt.statusline:append("%#PmenuSel#")
vim.opt.statusline:append("Buffer: %n | %t%y")

local function gitBranch()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n", "")  -- Remove trailing newline
end

-- Define a Lua function for statuslineGit
local function statuslineGit()
    local branchname = gitBranch()
    return #branchname > 0 and ' {' .. branchname .. '} ' or ''
end
vim.opt.statusline:append(statuslineGit())
--%{statuslineGit()}
