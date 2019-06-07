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
set termguicolors

call plug#begin()
" Plug 'https://github.com/conornewton/vim-latex-preview'
" Plug 'scrooloose/nerdtree'
Plug 'equalsraf/neovim-gui-shim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'junegunn/goyo.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'lervag/vimtex'
call plug#end()
color nord

autocmd FileType js   UltiSnipsAddFiletypes javascript-node.javascript.javascript-es6.all
autocmd FileType tex  UltiSnipsAddFiletypes tex.texmath.all
autocmd FileType css  UltiSnipsAddFiletypes css.all
autocmd FileType bib  UltiSnipsAddFiletypes bib.all
autocmd FileType lua  UltiSnipsAddFiletypes lua.all
autocmd FileType cs   UltiSnipsAddFiletypes cs.all
autocmd FileType python   UltiSnipsAddFiletypes python.all
autocmd FileType sh   UltiSnipsAddFiletypes sh.all
autocmd FileType nvim UltiSnipsAddFiletypes vim.all
autocmd FileType md   UltiSnipsAddFiletypes markdown.all

set bg=dark
set guifont=Iosevka\ Term\ SS02\ Light:h14
let g:session_dir = "~/.config/nvim/sessions/"
let g:latex_pdf_viewer = "mupdf"
let g:latex_engine = "pdflatex"
let g:vimtex_compiler_method = "pdflatex"
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
" nmap <C-m> :NERDTreeToggle<CR><CR>
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
autocmd FileType tex map <F4> :let g:TexFile = expand("%")<CR><CR>
autocmd FileType tex map <F5> :execute "! pdflatex  -halt-on-error " . g:TexFile . " && pkill -HUP mupdf" <CR>
autocmd FileType tex map <F9> :execute "! mupdf (echo (echo (basename "  . g:TexFile . ") \| sed 's/tex$/pdf/')) &disown"<CR>
autocmd FileType python map <F5> <Esc>:!python % <CR>

" Ibus engine stuffs
autocmd InsertEnter * :silent ! ibus engine Bamboo & disown
autocmd InsertLeave * :silent ! ibus engine xkb:us::eng  & disown
autocmd VimEnter * :silent ! ibus engine xkb:us::eng & disown
imap <F2> <Esc>:silent ! ibus engine xkb:us::eng<CR><CR>a
nmap <F2> :silent ! ibus engine Bamboo<CR><CR>
map <F3> :silent !~/.config/nvim/ibus-daemon-toggle.sh<CR><CR>

" Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" nvim-qt
exec 'map <C-k>f <Esc>:mks! ' . g:session_dir 
exec 'map <C-k><C-o> <Esc>:so ' . g:session_dir 

