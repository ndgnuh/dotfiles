set nocompatible
filetype indent on
syntax on


" OPTIONS
set number
if !(empty($DISPLAY))
	set clipboard=unnamedplus
endif
set shiftwidth=4
set tabstop=4
set softtabstop=4
set notermguicolors
set linebreak
set completeopt=menu,menuone,noselect

" Package path
let g:plug_path = stdpath("cache") . "/plugged"

" PACKAGE
call plug#begin(g:plug_path)
Plug 'junegunn/fzf', { 'dir': '~/.cache/.fzf', 'do': './install --all', 'on': 'FZF'}
Plug 'tpope/vim-surround'
Plug 'vim-autoformat/vim-autoformat', { 'on': 'Autoformat' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'morhetz/gruvbox'
Plug 'amadeus/vim-convert-color-to'
Plug 'neovim/nvim-lspconfig'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'ElmCast/elm-vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'elkowar/yuck.vim'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'neoclide/vim-jsx-improve'
Plug 'lukas-reineke/lsp-format.nvim'

" COMPLETION
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP auto installation
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()


" SETTING UP LUA PACKAGES
lua require("nvim_comment").setup{ comment_empty = false }


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
xmap ga :Tabularize/


" COLORSCHEME
colorscheme gruvbox
hi Normal ctermbg=NONE

" CHECK IF FILE EXISTS
function FileExist(path)
	return findfile(a:path, '.') == a:path
endfunction


" AUTOFORMAT
" TODO: toggle
" let g:JuliaFormatter_options = {
"         \ 'style' : 'yas',
"         \ }
" let g:JuliaFormatter_sysimage_path= g:plug_path . "/JuliaFormatter.vim/scripts/juliaformatter.so"
" if FileExist(g:JuliaFormatter_sysimage_path)
"	let g:JuliaFormatter_use_sysimage=1
" else
"	let g:JuliaFormatter_use_sysimage=0
" endif
augroup AUTOFORMAT
	au FileType elm,lua,tex,html,js,css au BufWritePre <buffer> :Autoformat
	au BufWritePre *.jl :JuliaFormatterFormat
	au BufWritePre *.sh,*.js :Autoformat
augroup END

" DETECT FILETYPE

" SOURCING OTHER FILES
function s:source(file)
	execute 'source ' . stdpath('config') . '/' . a:file
endfunction
call s:source('ibus.vim')
call s:source('statusline.vim')
" call s:source('google_python_style.vim')
augroup VIMSO
	" Auto sourcing the vim file when saved
	au FileType vim au BufWritePost <buffer> :so %
augroup END

lua require(".")


let g:python_recommended_style = 0
let g:formatters_python = ["black"]
