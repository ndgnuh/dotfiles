colorscheme nord
filetype plugin indent on
syntax on
runtime marcos/matchit.vim

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
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

autocmd FileType tex :map <F5> :! pdflatex % && pkill -HUP mupdf <CR><CR>
autocmd FileType tex :map <F9> :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd FileType cs :map <F5> :! clear && mcs /reference:System.Numerics.dll % && mono $(echo % \| sed 's/cs/exe/') <CR>
autocmd FileType cs :map <F9> :! clear && mono $(echo % \| sed 's/cs$/exe/') <CR>
autocmd BufWinEnter * setlocal modifiable

nmap <C-p> :Files<CR>
nmap <C-n> :NERDTreeToggle<CR><CR>
nmap T :terminal<CR>a<CR>
imap <C-s> <Esc> :w<CR><CR>
