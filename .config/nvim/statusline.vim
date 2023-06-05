hi SttFileName ctermbg=WHITE ctermfg=BLACK
hi SttMode ctermbg=WHITE ctermfg=BLACK
hi SttModified ctermbg=WHITE ctermfg=BLACK
hi SttPercentage ctermbg=WHITE ctermfg=BLACK
hi SttFileType ctermbg=WHITE ctermfg=BLACK
hi SttLineCol ctermbg=WHITE ctermfg=BLACK

" Tab line
hi TabLine cterm=none
hi Title ctermfg=WHITE ctermbg=NONE
hi TabLineFill ctermfg=GREY ctermbg=NONE
hi TabLine ctermfg=GREY ctermbg=NONE
hi TabLineSel ctermfg=BLACK ctermbg=WHITE

function! SttModified()
	let l:modified = &modified
	if &modified == 0
		return "-"
	else
		return "*"
	endif
endfunction

set laststatus=2
set noshowmode

set statusline=
set statusline+=%#SttMode#\ [%{toupper(mode())}]\ %#Normal#\ "
set statusline+=%#SttFileName#\ %f\ %#Normal#\ "
set statusline+=%#SttModified#\ %{SttModified()}\ %#Normal#\ "
set statusline+=%=
set statusline+=%#SttLineCol#\ %l\/%c\ %#Normal#\ "
set statusline+=%#SttPercentage#\ %P\/%L\ %#Normal#\ "
set statusline+=%#SttFiletype#\ %Y\ "
