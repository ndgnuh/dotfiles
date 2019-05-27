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
" Plug 'terryma/vim-multiple-cursors'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plug 'tpope/vim-surround'
" Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
" Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
call plug#end()

" map <C-char-92> :NERDTreeToggle

" let g:tex_flavor = 'latex'
let g:deoplete#enable_at_startup = 1
let g:auto_save = 1
" let g:UltiSnipExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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

" C# file snips
autocmd FileType cs :map <F5> :! clear && mcs /reference:System.Numerics.dll % && echo "\n\n\n" && mono $(echo % \| sed 's/cs/exe/') <CR>
autocmd FileType cs :map <F9> :! clear && mono $(echo % \| sed 's/cs$/exe/') <CR>
autocmd FileType cs :inoremap ,for for(<++>; <++>; <++>)<Enter>{<Enter><++><Enter>}<Esc>4?<++><Enter>"_4s
autocmd FileType cs :inoremap ,whdo while(<++>)<Enter>{<++><Enter>}<Esc>2?<++><Enter>"_4s
autocmd FileType cs :inoremap ,dowh do<Enter>{<++><Enter>}<Enter>while(<++>);<Esc>2?<++><Enter>"_4s
autocmd FileType cs :inoremap ,pbsm public static <++> (<++>)<Enter>{<Enter><++><Enter>}<Esc>3?<++><Enter>"_4s
autocmd FileType cs :inoremap ,pvsm public static <++> (<++>)<Enter>{<Enter><++><Enter>}<Esc>3?<++><Enter>"_4s
autocmd FileType cs :inoremap ,pbm public <++> (<++>)<Enter>{<Enter><++><Enter>}<Esc>3?<++><Enter>"_4s
autocmd FileType cs :inoremap ,pvm public <++> (<++>)<Enter>{<Enter><++><Enter>}<Esc>3?<++><Enter>"_4s
" autocmd FileType cs

autocmd BufWinEnter * setlocal modifiable

nmap <C-p> :Files<CR>
" nmap <C-m> :NERDTreeToggle<CR><CR>
" nmap T :terminal<CR>a<CR>
imap <C-s> <Esc> :w<CR><CR>

" Go yo map
map <C-f> :Goyo<CR><CR>

" Map split switcher
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w

" Clipboard
" map <C-S-v> "+P
vnoremap <C-c> "+y

" Automatically deletes all trailing whitespace on save.
map <F2> :%s/\s\+$//e<CR><CR>

nmap <Tab> gt
nmap <C-Tab> Gt
map <C-j> <Esc>/<++><Enter><Esc>"_4s
map <C-k> <Esc>?<++><Enter><Esc>"_4s
imap <C-j> <Esc>/<++><Enter><Esc>"_4s
imap <C-k> <Esc>?<++><Enter><Esc>"_4s
" Some latex snippets
autocmd BufNewFile,BufRead *.tex map <F4> :let g:TexFile = expand("%")<CR><CR>
autocmd BufNewFile,BufRead *.tex map <F5> :execute "! pdflatex  -halt-on-error " . g:TexFile . " && pkill -HUP mupdf" <CR>
autocmd BufNewFile,BufRead *.tex map <F9> :execute "! mupdf $(echo $(echo $(basename "  . g:TexFile . ") \| sed 's/tex$/pdf/')) &disown"<CR>
autocmd BufNewFile,BufRead *.tex command! -nargs=? TexBegin :norm i\begin{<args>}<Enter><++><Enter>\end{<args>}<++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.tex inoremap ,mnp \begin{minipage}[<++>]{<++>}<Enter>\end{minipage}<++><Esc>3?<++><Enter>"4_s
autocmd BufNewFile,BufRead *.tex inoremap ,center \begin{center}<Enter>\end{center}<++><Esc>O
autocmd BufNewFile,BufRead *.tex inoremap ,left \begin{flushleft}<Enter>\end{flushleft}<++><Esc>O
autocmd BufNewFile,BufRead *.tex inoremap ,right \begin{flushright}<Enter>\end{flushright}<++><Esc>O
autocmd BufNewFile,BufRead *.tex inoremap ,frame \begin{frame}{<++>}<Enter><++><Enter>\end{frame}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,item \begin{itemize}<Enter><++><Enter>\end{itemize}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,enum \begin{enumize}<Enter><++><Enter>\end{enumize}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,align \begin{align}<Enter><++><Enter>\end{align}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,*align \begin{align*}<Enter><++><Enter>\end{align*}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,eqn \begin{equation}<Enter><++><Enter>\end{equation}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,*eqn \begin{equation*}<Enter><++><Enter>\end{equation*}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,rray \begin{array}{<++>}<Enter><++><Enter>\end{array}<++><Esc>02k<Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,frac \frac{0}{<++>}<++><Esc>F0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,4 $0$<++><Esc>F0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,sec \section{0}<Enter><++><Esc>k0f0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,ssec \subsection{0}<Enter><++><Esc>k0f0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,sssec \subsubsection{0}<Enter><++><Esc>k0f0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,lab \label{0}<++><Esc>F0"_1s
autocmd BufNewFile,BufRead *.tex inoremap ,int \int_{<++>}^{<++>}<++><Esc><Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,sum \sum_{<++>}^{<++>}<++><Esc><Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,lim \lim_{<++>}<++><Esc><Tab>
autocmd BufNewFile,BufRead *.tex inoremap ,l{ \left\{<++>\right\}<++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.tex inoremap ,l( \left(<++>\right)<++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.tex inoremap ,l[ \left[<++>\right]<++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.tex inoremap ,begin <Esc>:TexBegin<Space>

" Ibus engine stuffs
autocmd InsertEnter * :silent ! ibus engine xkb:us::eng
autocmd InsertLeave * :silent ! ibus engine xkb:us::eng 
autocmd VimEnter * :silent ! ibus engine Bamboo
imap <F2> <Esc>:silent ! ibus engine xkb:us::eng<CR><CR>a
nmap <F2> :silent ! ibus engine Bamboo<CR><CR>
map <F3> :silent !~/.config/nvim/ibus-daemon-toggle.sh<CR><CR>

" Jump point
inoremap ,jp <++>
nnoremap ,jp A<++><Esc>

" Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Python files
autocmd BufNewFile,BufRead *.py map <F5> <Esc>:!python % <CR>
autocmd BufNewFile,BufRead *.py inoremap def<Tab> def <++>(<++>):<Enter><Esc><++><Esc>3?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.py inoremap df<Tab> def <++>(<++>):<Enter><Esc><++><Esc>3?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.py inoremap imp<Tab> <++><Esc>ggOimport<Space>
autocmd BufNewFile,BufRead *.py inoremap from<Tab> <++><Esc>ggOfrom<Space><++><Space>import<Space><++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.py inoremap f<Tab> if(<++>):<Enter><Esc><++><Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.py inoremap fe<Tab> if(<++>):<Enter><Esc><Esc>Esc>2?<++><Enter>"_4s
autocmd BufNewFile,BufRead *.py inoremap cmt<Tab> """ <++> """<Esc>?<++><Enter>"_4s

