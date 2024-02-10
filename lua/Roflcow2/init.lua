require('Roflcow2.remap')
require('Roflcow2.plugins')
require('Roflcow2.set')
require('Roflcow2.lazy')

local augroup = vim.api.nvim_create_augroup
local RoflcowGroup = augroup('Roflcow2', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank',{})

-- Flash highlight after yoinkage
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 500,
        })
    end,
})

--removes trailing white space
autocmd({'BufWritePre'}, {
    group = RoflcowGroup,
    pattern = '*',
    command = [[%s/\s\+$//ge]], --bruh i don't understand this shit I asked chatgpt aka god
})

local function gitBranch()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n", "")  -- Remove trailing newline
end

-- Define a Lua function for statuslineGit
function statuslineGit()
    local branchname = gitBranch()
    return #branchname > 0 and ' {' .. branchname .. '} ' or ''
end
--[[
function gitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
end
function statuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' {'.l:branchname.'} ':''
end
--]]
