hi SttFileName ctermbg=GREEN ctermfg=BLACK
hi SttMode ctermbg=GREEN ctermfg=BLACK
hi SttModified ctermbg=GREEN ctermfg=BLACK
hi SttPercentage ctermbg=GREEN ctermfg=BLACK
hi SttFileType ctermbg=GREEN ctermfg=BLACK
hi SttLineCol ctermbg=GREEN ctermfg=BLACK


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
