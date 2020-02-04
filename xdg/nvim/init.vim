filetype plugin indent on
syntax enable
runtime marcos/matchit.vim

call plug#begin()
" Indentation guide
" Plug 'https://github.com/thaerkh/vim-indentguides'

" Navigation
Plug 'scrooloose/nerdtree'
" Plug 'kkoomen/vim-doge'
" Plug 'akiyosi/gonvim-fuzzy'
" Plug 'Yggdroot/indentLine'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippet and completion
Plug 'roxma/nvim-yarp'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
" Plug 'joereynolds/vim-minisnip'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'http://github.com/joom/latex-unicoder.vim'
Plug 'robertbasic/vim-hugo-helper' " hugo helper

" Functionals
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'tbastos/vim-lua'

" Code display
Plug 'luochen1990/rainbow'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sleuth'
" Plug 'thiagoalessio/rainbow_levels.vim'

" Color schemes
Plug 'sainnhe/vim-color-forest-night'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()

nmap <C-/> gcc
vmap <C-/> gc

let g:rainbow_active = 1

" look and feels
set termguicolors
let g:enable_bold_font = 1
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
autocmd FileType jl   UltiSnipsAddFiletypes julia.all
autocmd FileType markdown setl conceallevel=0

" exit terminal mode with Esc key
tnoremap :q <C-\><C-n>

set bg=dark
let g:session_dir = "~/.config/nvim/sessions/"
let g:tex_conceal = ""
let g:deoplete#enable_at_startup = 1
let g:auto_save = 0
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
xmap ga :Tab/

" let g:indent_guides_enable_on_vim_startup = 1
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_char = '┊'

""" Ibus engine
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

" Background color
hi Normal guibg=#1d1f2175

" Open NERDTree if start with nvim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" toggle nerd tree
nmap <F4> :NERDTreeToggle<CR><CR>

" julia
let g:default_julia_version = '1.2'

" language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \       debug = false;
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Press F9 to toggle fold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Disable continual comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set options
set clipboard^=unnamedplus
set mouse=
set laststatus=2
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set number
set relativenumber
set history=50
set encoding=UTF-8
set formatoptions-=cro
" set listchars=tab:\┆\ 
" set list
set cursorcolumn
set cursorline
set expandtab
set softtabstop=4
set tabstop=4
set foldmethod=marker
set shiftwidth=4
set conceallevel=0

" auto latex to unicode
let g:latex_to_unicode_auto = 1
