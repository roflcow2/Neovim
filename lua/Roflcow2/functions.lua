local augroup = vim.api.nvim_create_augroup
local RoflcowGroup = augroup('Roflcow2', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank',{})
-- Get current git branch
local function gitBranch()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n", "")  -- Remove trailing newline
end

-- Make it work on statusline
function statuslineGit()
    local branchname = gitBranch()
    return #branchname > 0 and ' {' .. branchname .. '} ' or ''
end

--removes trailing white space and extra lines
autocmd({'BufWritePre'}, {
    group = RoflcowGroup,
    pattern = '*',
    command = [[%s/\s\+$//ge | %s/\(\n\s*\)\+\%$//e]], --bruh i don't understand this shit I asked chatgpt aka god
})
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
