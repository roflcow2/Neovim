"Functions
fun! TrimWhiteSpace()
        let l:save=winsaveview()
        call winrestview(l:save)
endfun

"Autogrup for custom auto commands
augroup commands
        autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
    
"Plugins
call plug#begin('~/.vim/plugged')
	Plug 'Townk/vim-autoclose'
	Plug 'tpope/vim-fugitive'
	Plug 'mbbill/undotree'
	Plug 'neovim/nvim-lspconfig'
	Plug 'liuchengxu/space-vim-dark'
    Plug 'neoclide/coc.nvim'
call plug#end()

lua require('config')

"Custom commands
command! MakeTags !ctags -R.

"Remaps
let mapleader = " "
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <Leader>cd :Rex
"move text up and down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
