filetype plugin indent on
syntax enable
runtime marcos/matchit.vim

" ~~~ Plugins ~~~
call plug#begin()
Plug 'bakpakin/fennel.vim'
Plug 'lambdalisue/suda.vim' " sudo when editting a file that is not write enabled
Plug 'frazrepo/vim-rainbow' " ))))))))))) is kinda hard
Plug 'sheerun/vim-polyglot' " language pack, indent, syntax and stuff
Plug 'tpope/vim-sleuth' " auto detect tab
Plug 'w0rp/ale' " linting and stuff
Plug 'scrooloose/nerdtree' " tree file explorer
Plug 'SirVer/ultisnips' " snippets
Plug 'honza/vim-snippets' " snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " ac
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' } " ac
Plug 'JuliaEditorSupport/julia-vim'
Plug 'http://github.com/joom/latex-unicoder.vim'
Plug 'robertbasic/vim-hugo-helper'
Plug 'https://github.com/tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'https://github.com/godlygeek/tabular'
call plug#end()

" lambda λ
imap <\-l> 'λ'
" rainbow brace for )))))))
" au FileType fennel call rainbow#load()

" Auto use suda:// when openning a file that is not writable
let g:suda_smart_edit = 1

" Highlight the line on which the cursor lives.
set nocursorline

" Always show at least one line above/below the cursor.
set scrolloff=15
" Always show at least one line left/right of the cursor.
set sidescrolloff=15

" Relative line numbers
set number relativenumber

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Use system clipboard
set clipboard=unnamedplus

" Remove timeout for partially typed commands
set notimeout

" F keys
" Quick write session with F2
map <F2> :mksession! ~/.vim_session<cr>
" And load session with F3
map <F3> :source ~/.vim_session<cr>

" Fix indentation
map <F7> gg=G<C-o><C-o>
" Toggle auto change directory
map <F8> :set autochdir! autochdir?<CR>

" Toggle vertical line
set colorcolumn=
fun! ToggleCC()
  if &cc == ''
    " set cc=1,4,21
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <silent> <F9> :call ToggleCC()<CR>

" Beginning and end of line
imap <C-a> <home>
imap <C-e> <end>
cmap <C-a> <home>
cmap <C-e> <end>

" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>
" Save + back into insert
" imap <C-S> <esc>:w<cr>a

" Control-C Copy in visual mode
vmap <C-C> y

" Control-V Paste in insert and command mode
imap <C-V> <esc>pa
cmap <C-V> <C-r>0

" Window Movement
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l

" Resizing
nmap <C-M-H> 2<C-w><
nmap <C-M-L> 2<C-w>>
nmap <C-M-K> <C-w>-
nmap <C-M-J> <C-w>+

" Insert mode movement
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
imap <M-f> <C-right>
imap <M-b> <C-left>

" Spacemacs-like keybinds
" Change <leader> bind from default \
" nnoremap <space> <nop>
" let mapleader=" "

" Make ci( work like quotes do
function! New_cib()
  if search("(","bn") == line(".")
    sil exe "normal! f)ci("
    sil exe "normal! l"
    startinsert
  else
    sil exe "normal! f(ci("
    sil exe "normal! l"
    startinsert
  endif
endfunction

" And for curly brackets
function! New_ciB()
  if search("{","bn") == line(".")
    sil exe "normal! f}ci{"
    sil exe "normal! l"
    startinsert
  else
    sil exe "normal! f{ci{"
    sil exe "normal! l"
    startinsert
  endif
endfunction

nnoremap ci( :call New_cib()<CR>
nnoremap cib :call New_cib()<CR>
nnoremap ci{ :call New_ciB()<CR>
nnoremap ciB :call New_ciB()<CR>

" Alt-m for creating a new line in insert mode
imap <M-m> <esc>o

" netrw configuration
let g:netrw_browse_split = 0
let g:netrw_altfile = 1

" Cycle windows
nmap <M-o> <C-W>w
vmap <M-o> <C-W>w
tmap <M-o> <esc><C-W>w
imap <M-o> <esc><C-W>w

" Command mode history
cmap <M-p> <up>
cmap <M-n> <down>
cmap <M-k> <up>
cmap <M-j> <down>

" Back to normal mode from insert
" inoremap jk <esc>
" inoremap JK <esc>

" Manually refresh file
nmap <F5> :e!<cr>

" Indentation
set smarttab
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4

"set smartindent
set autoindent
"set cindent

set nocompatible
filetype plugin indent on

" Write buffer through sudo (works on vim but not neovim)
" cnoreabbrev w!! w !sudo -S tee % >/dev/null
" Neovim: suda plugin
cnoreabbrev w!! w suda://%

" Allow switching between buffers without saving
set hidden

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" Substitute live preview
set inccommand=nosplit

" Markdown Folding
" let g:markdown_fold_style = 'nested'

" Shell
set shell=/bin/zsh

" Ctrlp
let g:ctrlp_switch_buffer = '0'
" Useful for large projects
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10
" So that it does not only index starting from current directory
let g:ctrlp_working_path_mode = ""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Use ag AKA the_silver_searcher for indexing. Faster!!!
" TIP: Use ~/.ignore to ignore directories/files
" set grepprg=ag\ --nogroup\ --nocolor
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
""if executable('ag')
""  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
""endif
let g:ctrlp_show_hidden =1
let g:ctrlp_clear_cache_on_exit = 0

" Lightline
" Get default from :h lightline
let g:lightline = {
      \ 'colorscheme': 'lena',
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste', 'sep1' ],
      \           [ 'readonly', 'filename', 'modified' ],
      \           [ ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'filetype' ] ]
      \ }

let g:lightline.inactive = {
      \ 'left': [ [ 'mode', 'paste', 'sep1' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'filetype' ] ]
      \ }

let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ ] }

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.component = {
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'modified': '%M',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%R',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&ff}',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'percent': '%3p%%',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%3l:%-2v',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}',
      \ 'sep1': ''
      \}

let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'L',
      \ "\<C-v>": 'B',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'T',
      \ }


let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': '' 
      \}

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 1
      \ }

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

set wildmenu

set encoding=utf8
scriptencoding utf-8

" Colorscheme
colorscheme lena
set fillchars=vert::

" Restore last cursor position and marks on open
au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
      \ |   exe "normal! g`\""
      \ | endif

" Disable continual comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" FZF shortcut
nmap <C-p> :FZF<CR>

" Easy align
xmap ga :Tab/

" Use tab key to switch tab
nmap <Tab> gt
nmap <C-Tab> Gt

" statusline
source ~/.config/nvim/statusline.vim

" ibus engine stuff
function! IbusOff()
  " Lưu engine hiện tại
  let g:ibus_prev_engine = system('ibus engine')
  " Chuyển sang engine tiếng Anh
  execute 'silent !ibus engine xkb:us::eng'
endfunction
function! IbusOn()
  let l:current_engine = system('ibus engine')
  " nếu engine được set trong normal mode thì
  " lúc vào insert mode duùn luôn engine đó
  if l:current_engine !~? 'xkb:us::eng'
    let g:ibus_prev_engine = l:current_engine
  endif
  " Khôi phục lại engine
  execute 'silent !' . 'ibus engine ' . g:ibus_prev_engine
endfunction
autocmd InsertEnter * call IbusOn()
autocmd InsertLeave * call IbusOff()
call IbusOff()

" toggle nerd tree with F4
nmap <F4> :NERDTreeToggle<CR><CR>

" Jump to lint error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Code formats
" Looks awesome with Victor mono and cursive-italic font
set notermguicolors
highlight Comment cterm=italic,underline gui=italic,underline
highlight Keyword gui=italic cterm=italic
highlight Repeat gui=italic cterm=italic
" highlight Label gui=italic cterm=italic
" highlight Exception gui=italic cterm=italic
" highlight Conditional gui=bold cterm=bold
highlight Special gui=italic,bold cterm=italic,bold
" highlight Type gui=bold cterm=bold
" highlight Function gui=bold cterm=bold

" toggle wrapping
function! ToggleWrap()
    if &wrap == 1
        set nowrap
    else
        set wrap
    endif
endfunction
nnoremap <F12> :silent :call ToggleWrap()<CR>
set nowrap

