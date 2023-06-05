hi SttFileName ctermbg=LIGHTBLUE ctermfg=BLACK
hi SttMode ctermbg=LIGHTBLUE ctermfg=BLACK
hi SttModified ctermbg=LIGHTBLUE ctermfg=BLACK
hi SttPercentage ctermbg=LIGHTBLUE ctermfg=BLACK
hi SttFileType ctermbg=LIGHTBLUE ctermfg=BLACK
hi SttLineCol ctermbg=LIGHTBLUE ctermfg=BLACK

" Tab line
hi TabLine ctermfg=NONE
hi Title ctermfg=LIGHTBLUE ctermbg=NONE
hi TabLineFill ctermfg=GREY ctermbg=NONE
hi TabLine ctermfg=GREY ctermbg=NONE
hi TabLineSel ctermfg=BLACK ctermbg=LIGHTBLUE

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
