return {
	'liuchengxu/space-vim-dark',
	priority = 1000, --load before anything
	config = function() --function to call vim command to set colorscheme
		vim.cmd([[colorscheme space-vim-dark]])
	end,
}
