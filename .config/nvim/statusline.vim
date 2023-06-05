hi SttFileName ctermbg=12 ctermfg=BLACK
hi SttMode ctermbg=12 ctermfg=BLACK
hi SttModified ctermbg=12 ctermfg=BLACK
hi SttPercentage ctermbg=12 ctermfg=BLACK
hi SttFileType ctermbg=12 ctermfg=BLACK
hi SttLineCol ctermbg=12 ctermfg=BLACK

" Tab line
hi TabLine ctermfg=NONE
hi Title ctermfg=12 ctermbg=NONE
hi TabLineFill ctermfg=GREY ctermbg=NONE
hi TabLine ctermfg=GREY ctermbg=NONE
hi TabLineSel ctermfg=BLACK ctermbg=12

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
