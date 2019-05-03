colorscheme nord
filetype plugin indent on
syntax on
runtime marcos/matchit.vim

set laststatus=2
set cindent
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set number
set history=50
set modifiable
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
call plug#end()

let g:tex_flavor = 'latex'
let g:deoplete#enable_at_startup = 1
let g:auto_save = 1
let g:UltiSnipExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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

autocmd FileType tex :map <F5> :! pdflatex -halt-on-error % && pkill -HUP mupdf <CR>
autocmd FileType tex :map <F9> :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd FileType cs :map <F5> :! clear && mcs /reference:System.Numerics.dll % && mono $(echo % \| sed 's/cs/exe/') <CR>
autocmd FileType cs :map <F9> :! clear && mono $(echo % \| sed 's/cs$/exe/') <CR>
autocmd BufWinEnter * setlocal modifiable

nmap <C-p> :Files<CR>
nmap <C-n> :NERDTreeToggle<CR><CR>
nmap T :terminal<CR>a<CR>
imap <C-s> <Esc> :w<CR><CR>

" Go yo map
map <C-f> :Goyo<CR><CR>

" Map split switcher
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w

" Clipboard
map <C-p> "+P
vnoremap <C-c> "+y

" Automatically deletes all trailing whitespace on save.
" autocmd BufWritePre * %s/\s\+$//e

" Some latex snippets
autocmd FileType tex: inoremap \center \begin{center}"your text"\end{center}

" Auto ibus engine
autocmd InsertEnter * :silent ! ibus engine Bamboo
autocmd InsertLeave * :silent ! ibus engine xkb:us::eng 
autocmd VimEnter * :silent ! ibus engine xkb:us::eng 
