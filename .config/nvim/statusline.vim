hi SttFileName ctermbg=2 ctermfg=BLACK
hi SttMode ctermbg=2 ctermfg=BLACK
hi SttModified ctermbg=2 ctermfg=BLACK
hi SttPercentage ctermbg=2 ctermfg=BLACK
hi SttFileType ctermbg=2 ctermfg=BLACK
hi SttLineCol ctermbg=2 ctermfg=BLACK

" Tab line
hi TabLine cterm=NONE
hi Title ctermfg=2 ctermbg=NONE
hi TabLineFill ctermfg=GREY ctermbg=NONE
hi TabLine ctermfg=GREY ctermbg=NONE
hi TabLineSel ctermfg=BLACK ctermbg=2

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
