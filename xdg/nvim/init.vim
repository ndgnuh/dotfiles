filetype plugin indent on
syntax enable
runtime marcos/matchit.vim

call plug#begin()
" Plug 'kkoomen/vim-doge'
" Plug 'akiyosi/gonvim-fuzzy'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'scrooloose/nerdtree'
" Snippet and completion
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Functionals
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'

" Code display
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sleuth'
" Plug 'thiagoalessio/rainbow_levels.vim'

" Color schemes
Plug 'sainnhe/vim-color-forest-night'
Plug 'dylanaraps/wal.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'altercation/vim-colors-solarized'
call plug#end()

nmap <C-/> gcc
vmap <C-/> gc

" look and feels
set guifont=Clear\ Sans:h14
set termguicolors
let g:enable_bold_font = 1
let g:hybrid_transparent_background = 0
colorscheme onehalfdark
if has('gui_running')
    set background=light
else
    set background=dark
endif

" ultisnips
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

" exit terminal mode with Esc key
tnoremap :q <C-\><C-n>

set bg=dark
let g:session_dir = "~/.config/nvim/sessions/"
let g:tex_conceal = ""
let g:deoplete#enable_at_startup = 1
let g:auto_save = 1
let g:UltiSnipExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo'],
      \              [ 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


nmap <C-p> :Files<CR>
imap <C-s> <Esc> :w<CR><CR>

" Vim ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Go yo map
map <C-f> :Goyo<CR><CR>

" Quickly switch between splits
map <C-h> <C-w>h
" map <C-k> <C-w>k
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
autocmd FileType tex map <F5> :!make pdf <CR>
autocmd FileType tex map <F6> :!make preview <CR>
autocmd FileType tex map <F7> :!make clean <CR>
autocmd FileType tex map <F7> :!make bib <CR>

" Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:indent_guides_enable_on_vim_startup = 1
" let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_bgcolor_term = 202
let g:indentLine_char = '┊'

" Ibus engine stuffs
:silent! unmap <F2>
:silent! unmap <F3>
:silent! unmap <F4>

" autocmd InsertEnter * :silent ! ibus engine Bamboo & disown
" autocmd InsertLeave * :silent ! ibus engine xkb:us::eng  & disown
" autocmd VimEnter * :silent ! ibus engine xkb:us::eng & disown

imap <F2> <Esc>:silent ! ibus engine xkb:us::eng<CR><CR>a
map <F2> :silent ! ibus engine Bamboo<CR><CR>
map <F3> :silent !~/.config/nvim/ibus-daemon-toggle.sh<CR><CR>
"
" ʕ◔ϖ◔ʔ Gonvim setting
if exists('g:gonvim_running')
  " ʕ◔ϖ◔ʔ Use Gonvim UI instead of vim native UII
  let mapleader = "\\"
  set laststatus=0
  set noshowmode
  set noruler

  " ʕ◔ϖ◔ʔ I use `ripgrep` for :GonvimFuzzyAg
  let g:gonvim_fuzzy_ag_cmd = 'rg --column --line-number --no-heading --color never'

  " ʕ◔ϖ◔ʔ Mapping for gonvim-fuzzy
  nnoremap <leader><leader> :GonvimWorkspaceNew<CR>
  nnoremap <leader>n :GonvimWorkspaceNext<CR>
  nnoremap <leader>p :GonvimWorkspacePrevious<CR>
  nnoremap <leader>ff :GonvimFuzzyFiles<CR>
  nnoremap <C-p> :GonvimFuzzyFiles<CR>
  nnoremap <leader>fg :GonvimFuzzyAg<CR>
  nnoremap <leader>fb :GonvimFuzzyBuffers<CR>
  nnoremap <leader>fl :GonvimFuzzyBLines<CR>
endif

" Background color
hi Normal guibg=#242426

" Set options
set clipboard^=unnamedplus
set shiftwidth=4
set comments
set mouse=a
set laststatus=2
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set number
set relativenumber
set history=50
set encoding=UTF-8

