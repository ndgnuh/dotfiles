colorscheme nord
filetype plugin indent on
syntax on
runtime marcos/matchit.vim

set mouse=a
set laststatus=2
set cindent
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set number
set relativenumber
set history=50
set modifiable

call plug#begin()
" Plug 'Valloric/YouCompleteMe'
" Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

autocmd BufNewFile,BufRead *.js   UltiSnipsAddFiletypes javascript-node.javascript.javascript-es6.all
autocmd BufNewFile,BufRead *.tex  UltiSnipsAddFiletypes tex.texmath.all
autocmd BufNewFile,BufRead *.css  UltiSnipsAddFiletypes css.all
autocmd BufNewFile,BufRead *.bib  UltiSnipsAddFiletypes bib.all
autocmd BufNewFile,BufRead *.lua  UltiSnipsAddFiletypes lua.all
autocmd BufNewFile,BufRead *.cs   UltiSnipsAddFiletypes cs.all
autocmd BufNewFile,BufRead *.py   UltiSnipsAddFiletypes python.all
autocmd BufNewFile,BufRead *.sh   UltiSnipsAddFiletypes sh.all
autocmd BufNewFile,BufRead *.nvim UltiSnipsAddFiletypes vim.all
autocmd BufNewFile,BufRead *.md   UltiSnipsAddFiletypes markdown.all

let g:deoplete#enable_at_startup = 1
let g:NERDTreeWinPos = "right"
let g:auto_save = 1
let g:UltiSnipExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


nmap <C-p> :Files<CR>
nmap <C-m> :NERDTreeToggle<CR><CR>
imap <C-s> <Esc> :w<CR><CR>

" Go yo map
map <C-f> :Goyo<CR><CR>

" Quickly switch between splits
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w

" Clipboard
" map <C-S-v> "+P
vnoremap <C-c> "+y

" Delete white space
map <F4> :%s/\s\+$//e<CR><CR>

" switch tab
nmap <Tab> gt
nmap <C-Tab> Gt

" run stuffs
autocmd BufNewFile,BufRead *.tex map <F4> :let g:TexFile = expand("%")<CR><CR>
autocmd BufNewFile,BufRead *.tex map <F5> :execute "! pdflatex  -halt-on-error " . g:TexFile . " && pkill -HUP mupdf" <CR>
autocmd BufNewFile,BufRead *.tex map <F9> :execute "! mupdf (echo (echo (basename "  . g:TexFile . ") \| sed 's/tex$/pdf/')) &disown"<CR>
autocmd BufNewFile,BufRead *.py map <F5> <Esc>:!python % <CR>

" Ibus engine stuffs
autocmd InsertEnter * :silent ! ibus engine Bamboo
autocmd InsertLeave * :silent ! ibus engine xkb:us::eng 
autocmd VimEnter * :silent ! ibus engine xkb:us::eng
imap <F2> <Esc>:silent ! ibus engine xkb:us::eng<CR><CR>a
nmap <F2> :silent ! ibus engine Bamboo<CR><CR>
map <F3> :silent !~/.config/nvim/ibus-daemon-toggle.sh<CR><CR>

" Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
