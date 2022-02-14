set nocompatible
filetype indent on
syntax on


" OPTIONS
set number
set clipboard=unnamedplus
set shiftwidth=4
set tabstop=4
set softtabstop=4
set notermguicolors
set linebreak


" PACKAGE
call plug#begin(stdpath("cache") . "/plugged")
Plug 'junegunn/fzf', { 'dir': '~/.cache/.fzf', 'do': './install --all', 'on': 'FZF'}
Plug 'tpope/vim-surround'
Plug 'vim-autoformat/vim-autoformat', { 'on': 'Autoformat' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'morhetz/gruvbox'
Plug 'amadeus/vim-convert-color-to'
Plug 'neovim/nvim-lspconfig'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-fugitive'
call plug#end()


" SETTING UP LUA PACKAGES
lua << EOF
require("nvim_comment").setup{ comment_empty = false }
EOF


" MAPPING
nmap <C-p> <cmd>FZF<Cr>
nnoremap <Esc> <cmd>noh<CR>
" Search visual
vnoremap <leader>f y
			\<cmd>mkview<CR>
			\/<C-R>=escape(@",'/\')<CR><CR>
			\<cmd>loadview<CR>
			\<cmd>set hlsearch<CR>
map <leader>so <cmd>execute "source " . stdpath('config') . "/init.vim"<CR>
xmap ga :Tab/


" COLORSCHEME
colorscheme gruvbox
hi Normal ctermbg=NONE


" AUTOFORMAT
" TODO: toggle
augroup AUTOFORMAT
	au FileType python,elm,lua,tex,julia au BufWritePre <buffer> :Autoformat
	au BufWritePre *.sh :Autoformat
augroup END


" SOURCING OTHER FILES
function s:source(file)
	execute 'source ' . stdpath('config') . '/' . a:file
endfunction
call s:source('ibus.vim')
call s:source('statusline.vim')
augroup VIMSO
	" Auto sourcing the vim file when saved
	au FileType vim au BufWritePost <buffer> :so %
augroup END

" lua pcall(require, "lsp")
lua require("lsp")
